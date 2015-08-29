class Catalog < ActiveRecord::Base
	has_many :site_catalogs
	has_many :catalogs, :through => :site_catalogs
	has_many :contributions

	def self.add_catalogs(cat_ids,site_id)
		cat_ids.split(',').each do |cat_id|
			SiteCatalog.find_or_create_by_site_id_and_cat_id(site_id,cat_id,{:purchased => false})
		end
	end

	def contribute(site_id,guest_id,amount,message)
		Contribution.create({
			:catalalog_id => self.id,
			:site_id => site_id,
			:guest_id => guest_id,
			:amount => amount,
			:message => message
		})
	end

	def effective_price(site_id)
		self.price - self.contributions.select{|c| c.site_id == site_id}.map(&:amount).inject(:+).to_f
	end

	def contribution_percentage(site_id)
		(100 - ((self.effective_price(site_id)/self.price)*100)).to_f
	end

	def catalog_already_purchased(site_id)
		(order = Order.find_by_site_id,catalog_id(site_id,self.id)).present? && order.status == 'done'
	end

	def available?(site_id)
		self.quantity > 0 && self.price > 0.0 && !self.catalog_already_purchased
	end
end
