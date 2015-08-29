class SiteCatalog < ActiveRecord::Base
	belongs_to :catalogs
	belongs_to :sites
end
