class SearchController < ApplicationController
  def show
    if (category_id = params[:product_category_id])
      @catalogs = @site.catalogs.catagory_id_eq(category_id)
    else
      @catalogs = @site.catalogs
    end
  end

  def add_catalogs
    cat_ids = params[:cat_ids].split(',')
    Catalog.add_catalogs(cat_ids,@site.id)
  end

  def remove_catalog
  end

  def create_site
    name = params[:name]
    shipping_address = params[:address]
    Site.create({:name => name,:shipping_address => shipping_address})
    clone_selected_catalog
  end

  def show_cart
    @catalog = Catalog.find_by_id params[:catalog_id]
    @contribution = params[:contribution] || false
  end

  def buy_catalog
    amount = params[:amount].to_f
    message = params[:message]
    name = params[:name]
    address = params[:address]
    contact = params[:contact]

    guest = Guest.create({
      :name => name,
      :contact => contact,
      :address => address,
      :site_id => @site.id
    })

    cat_id = params[:cat_id]
    contribution = params[:contribution]
    Order.place_order(@site.id,guest.id,cat_id,amount,contribution,message,address)    
    redirect_to :action => :show
  end

  private

   def clone_selected_catalog
     catalog = SiteCatalog.find :conditions => ["catalog_id in ? and site_id in ?",  params[:catalog_ids], 1]
     cloned_catalog = catalog.clone
     cloned_catalog.update_attribute :site_id, @site.id
     cloned_catalog.touch
   end

end
