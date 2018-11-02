class ProductsController < ApplicationController
  def index
    @tag = Tag.all
    @prod = Product.all
    @fearured_product1 = Product.all.sample
    @fearured_product2 = Product.all.sample
    @fearured_product3 = Product.all.sample
    @category = Category.all
  end

  def show
     @product = Product.find(params[:id])
  end
end
