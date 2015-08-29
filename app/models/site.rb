class Site < ActiveRecord::Base
	has_many :site_catalogs, :foreign_key => "site_id"
	has_many :catalogs, :through => :site_catalogs
	has_many :orders
	has_many :guests

	def self.create_site(owner)
		Site.create({:site_name => owner.name + ".dev",:owner_id => owner.id})
	end

end

