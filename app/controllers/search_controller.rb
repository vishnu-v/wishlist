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
    Site.create({:name => name,shipping_address => shipping_address})
  end

  def show_cart
    @catalog = Catalog.find_by_id params[:catalog_id]
    @contribution = params[:contribution] || nil
  end

  def buy_catalog
    amount = params[:amount]
    message = params[:message]
    name = params[:name]
    address = params[:address]
    contact = params[:contact]

    guest = Guest.create({
      :name => name,
      :amount => amount,
      :contact => contact,
      :address => address,
      :site_id => @site.id
    })

    cat_id = params[:cat_id]
    Order.place_order(@site.id,cat_id,guest_id,amount,message,shipping_address)    
  end


end
