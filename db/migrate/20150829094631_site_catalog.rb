class SiteCatalog < ActiveRecord::Migration
  def self.up
  	create_table :site_catalogs do |t|
  		t.integer :cat_id
  		t.integer :site_id
  		t.boolean :purchased
  		t.timestamps
  	end
  end

  def self.down
  end
end
