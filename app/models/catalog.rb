class Catalog < ActiveRecord::Base
	has_many :site_catalogs, :foreign_key => "cat_id"
	has_many :catalogs, :through => :site_catalogs
	has_many :contributions

	def self.add_catalogs(cat_ids,site_id)
		cat_ids.split(',').each do |cat_id|
			SiteCatalog.find_or_create_by_site_id_and_cat_id(site_id,cat_id,{:purchased => false})
		end
	end

	def contribute(site_id,amount,guest_id,message)
		if (contribution = Contribution.all(:conditions => ["catalalog_id = ? AND site_id = ? AND guest_id = ?",self.id,site_id,guest_id])).present?
			contribution = contribution.last
			contribution.amount += amount
			contribution.message = message
			contribution.save
		else
			Contribution.create({
				:catalalog_id => self.id,
				:site_id => site_id,
				:amount => amount,
				:message => message
			})
		end
	end

	def effective_price(site_id)
		self.amount - self.contributions.select{|c| c.site_id == site_id}.map(&:amount).inject(:+).to_f
	end


	def available(site_id)
		self.quantity > 0 && self.price > 0.0 && self.contributions.select{|c| c.site_id == site_id }
	end
end
