class AddProductCategoryIdToCatalog < ActiveRecord::Migration
  def self.up
  	add_column :catalogs, :product_category_id, :integer
  end

  def self.down
  	remove_column :catalogs, :product_category_id
  end
end
