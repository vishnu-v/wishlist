class ProductCategory < ActiveRecord::Base
	has_many :catalogs
end
