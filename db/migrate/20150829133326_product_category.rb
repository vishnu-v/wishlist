class ProductCategory < ActiveRecord::Migration
  def self.up
  	create_table :product_category do |t|
  		t.string :name
  		t.timestamps
  	end
  end

  def self.down
  end
end
