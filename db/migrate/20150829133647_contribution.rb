class Contribution < ActiveRecord::Migration
  def self.up
  	create_table :contributions do |t|
  		t.integer :guest_id
  		t.string :message
  		t.decimal :amount
  		t.integer :site_id
  		t.integer :catalog_id
  		t.timestamps
  	end
  end

  def self.down
  end
end
