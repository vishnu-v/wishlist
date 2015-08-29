class SearchController < ApplicationController
  def show
    if (category_id = params[:product_category_id])
      @catalogs = @site.catalogs.catagory_id_eq(category_id)
    else
      @catalogs = @site.catalogs
    end
  end

  def add_catalog
  end

  def remove_catalog
  end

  def create_wishlist
  end

  def show_cart
    @catalog = Catalog.find_by_id params[:catalog_id]
    @contribution = params[:contribution] || nil
  end

  def buy_catalog
  end

  def contribute
  end

end
