class Order < ActiveRecord::Base
	belongs_to :site

	def self.place_order(site_id,guest_id,cat_id,amount,message=nil,shipping_addr = nil)
		cat = Catalog.find(cat_id)
		contributors = ""

		if amount == cat.effective_amount(site_id)
			status = 'done'
			cat.quantity -= 1
		else
			contr = cat.contribute(site_id,amount,guest_id,message)
			status = 'partial'
		end

		order = Order.find_or_initialize_by_site_id_and_catalog_id(site_id,cat_id)

		if order.status.present?
			contributors = order.contributors.split(',').push(contr.id).to_s
		end

		Order.update_attributes(
			:amount => amount,
			:status => status,
			:shipping_address => shipping_addr,
			:contributors => contributors
		)
		
		cat.save
	end

end
