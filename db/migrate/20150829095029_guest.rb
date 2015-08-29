class Guest < ActiveRecord::Migration
  
  def self.up
  	create_table :guests do |t|
  		t.string :name
  		t.string :address
  		t.string :contact
  		t.integer :site_id
  		t.timestamps
  	end
  end

  def self.down
  end
end
