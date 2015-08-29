class Order < ActiveRecord::Migration
  def self.up
  	create_table :orders do |t|
  		t.string :shipping_address
  		t.integer :price
  		t.integer :guest_id
  		t.integer :cat_id
  		t.integer :site_id
  		t.timestamps
  	end
  end

  def self.down
  end
end
