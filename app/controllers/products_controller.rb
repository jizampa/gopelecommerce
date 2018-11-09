class ProductsController < ApplicationController
  def index
    @tag = Tag.all
    @prod = Product.all
    @category = Category.all
    @fearured_product1 = Product.where('category_id = 1').sample
    @fearured_product2 = Product.where('category_id = 2').sample
    @fearured_product3 = Product.where('category_id = 3').sample
    
  end

  def show
    @tag = Tag.all
    @prod = Product.all
    @category = Category.all
    @product = Product.find(params[:id])
  end
end
