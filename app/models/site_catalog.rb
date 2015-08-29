class SiteCatalog < ActiveRecord::Base
	belongs_to :catalog
	belongs_to :site
end
