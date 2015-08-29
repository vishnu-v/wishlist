class Catalog < ActiveRecord::Migration
  def self.up
  	create_table :catalogs do |t|
  		t.string :title
  		t.string :description
  		t.integer :vendor_id
  		t.decimal :price
  		t.integer :quantity
  		t.timestamps
  	end
  end

  def self.down
  end
end
