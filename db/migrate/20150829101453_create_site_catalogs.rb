class CreateSiteCatalogs < ActiveRecord::Migration
  def self.up
    create_table :site_catalogs do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :site_catalogs
  end
end
