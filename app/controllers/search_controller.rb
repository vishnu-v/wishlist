class SearchController < ApplicationController
  def show
    if (category_id = params[:id]).present?
      @catalogs = @site.catalogs.select{|c| c.product_category_id == params[:id].to_i}
    else
      @catalogs = @site.catalogs
    end
    min = params[:min] || nil
    max = params[:max] || nil
    if min && max && (min = min.to_i) <= (max = max.to_i)
      @catalogs = @catalogs.select{|c| c.price >= min && c.price <= max}
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


end
