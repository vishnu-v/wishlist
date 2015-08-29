class Order < ActiveRecord::Base
	belongs_to :site

	def self.place_order(site_id,guest_id,cat_id,amount,contribution,message=nil,shipping_addr = nil)
		cat = Catalog.find(cat_id)
		contributors = ""

		if contribution == 'true'
			if amount == cat.effective_price(site_id)
				status = 'done'
				cat.quantity -= 1
			else
				status = 'partial'
			end
			contr = cat.contribute(site_id,guest_id,amount,message)
			guest_id = nil
		else			
			status = 'done'
			cat.quantity -= 1
		end

		order = Order.find_or_initialize_by_site_id_and_catalog_id(site_id,cat_id)

		if contribution == 'true'
			if order.contributors
				contributors = order.contributors.split(',').push(contr.id.to_s).join(",")
			else
				contributors = contr.id.to_s
			end
		end

		order.update_attributes(
			:price => amount,
			:status => status,
			:shipping_address => shipping_addr,
			:guest_id => guest_id,
			:contributors => contributors
		)
		
		cat.save
	end

end
