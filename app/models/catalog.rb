class Catalog < ActiveRecord::Base
	has_many :site_catalogs, :foreign_key => "cat_id"
	has_many :catalogs, :through => :site_catalogs
end
