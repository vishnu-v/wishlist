class Vendor < ActiveRecord::Migration
  def self.up
  	create_table :vendors do |t|
  		t.string :name
  		t.integer :contact
  		t.string :address
  		t.integer :rating
  		t.timestamps
  	end
  end

  def self.down
  end
end
