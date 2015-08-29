class AddImageUrlToCatalog < ActiveRecord::Migration
  def self.up
  	add_column :catalogs, :image_urls, :string
  end

  def self.down
  end
end
