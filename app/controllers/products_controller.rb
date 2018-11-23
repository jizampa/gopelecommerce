# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    add_breadcrumb 'home', '/'

    @product = (Product.where('name LIKE ?', "%#{params[:term]}%") if params[:term])

    @fearured_product1 = Product.where('category_id = 1').sample
    @fearured_product2 = Product.where('category_id = 2').sample
    @fearured_product3 = Product.where('category_id = 3').sample

    # @productSearched = Product.where('name LIKE ?', "%#{params[:term]}%")
    @product_searched = Product.where('title LIKE ? AND category_id = ?', "%#{params[:term]}%", params[:cat_id])

    @idsearched = params[:cat_id]
  end

  def show
    @product = Product.find(params[:id])
    prod_name = @product.title
    prod_cat = @product.category.name
    catid = @product.category.id
    cat_path = '/categories/' + catid.to_s
    @item_path = '/products/' + params[:id]
    add_breadcrumb 'Home', root_path
    add_breadcrumb prod_cat, cat_path
    add_breadcrumb prod_name, @item_path
  end

  def product_params
    params.require(:product).permit(:term)
  end
end
