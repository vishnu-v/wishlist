class Order < ActiveRecord::Base
	belongs_to :site

	def self.place_order(site_id,guest_id,price,cat_id,shipping_addr = nil)
		cat = Catalog.find(cat_id)
		if amount == cat.effective_amount(site_id)
			status = 'done'
		else
			status = 'partial'
		end
		Order.create({
			:site_id => site_id,
			:guest_id => guest_id,
			:amount => amount,
			:status => status,
			:cat_id => cat_id,
			:shipping_addr => shipping_addr || Owner.find(Site.find(site_id).owner_id).address
		})
	end
end
