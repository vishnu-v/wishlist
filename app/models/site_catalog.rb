class SiteCatalog < ActiveRecord::Base
    belongs_to :catalog
    belongs_to :site

    def self.add_catalogs(cat_ids,site_id)
        condition = []
        cat_ids.split(",").each do |cid| 
          condition << "(#{site_id},#{cid},false)"
        end
        condition = condition.join(",")
        ActiveRecord::Base.connection.execute("INSERT INTO site_catalogs(site_id,catalog_id,purchased) VALUES " + condition)
    end
end
