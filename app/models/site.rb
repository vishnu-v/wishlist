class Site < ActiveRecord::Base
	has_many :site_catalogs
	has_many :catalogs, :through => :site_catalogs
	has_many :orders
	has_many :guests
end

