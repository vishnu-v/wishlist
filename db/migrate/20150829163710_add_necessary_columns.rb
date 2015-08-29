class AddNecessaryColumns < ActiveRecord::Migration
  def self.up
   	remove_column :sites, :contact
  	remove_column :sites, :owner_name
  	add_column :sites, :owner_id, :integer

  	remove_column :site_catalogs, :cat_id
  	add_column :site_catalogs, :catalog_id, :integer

  	remove_column :orders, :cat_id
  	add_column :orders, :catalog_id, :integer
  	add_column :orders, :status, :string
  	add_column :orders, :contributors, :text
  end

  def self.down
  end
end
