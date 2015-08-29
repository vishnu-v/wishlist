class ChangesToTables < ActiveRecord::Migration
  def self.up
  	add_column :sites, :theme, :string
  	execute("INSERT INTO sites (name,theme,owner_id,shipping_address) values('root',NULL,NULL,NULL)")
  end

  def self.down
  end
end
