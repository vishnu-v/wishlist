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

  def buy_catalog
  end

  def contribute
  end

end
