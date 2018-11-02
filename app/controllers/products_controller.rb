class ProductsController < ApplicationController
  def index
    @tag = Tag.all
    @prod = Product.all
    @fearured_product1 = Product.where('category_id = 1').sample
    @fearured_product2 = Product.where('category_id = 2').sample
    @fearured_product3 = Product.where('category_id = 3').sample
    @category = Category.all
  end

  def show
     @product = Product.find(params[:id])
  end
end
