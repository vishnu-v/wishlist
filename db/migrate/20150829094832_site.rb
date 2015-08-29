class Site < ActiveRecord::Migration
  
  def self.up
  	create_table :sites do |t|
  		t.string :name
  		t.string :shipping_address
  		t.string :owner_name
  		t.string :contact
  		t.timestamps
  	end
  end

  def self.down
  end
end
