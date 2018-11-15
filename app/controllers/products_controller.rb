class ProductsController < ApplicationController
  def index
  add_breadcrumb "home", "/"
   
    @fearured_product1 = Product.where('category_id = 1').sample
    @fearured_product2 = Product.where('category_id = 2').sample
    @fearured_product3 = Product.where('category_id = 3').sample
    
  end

  def show

    @product = Product.find(params[:id])
    prodName = @product.title
    prodCat = @product.category.name
    catid = @product.category.id
    catPath = "/categories/"+(catid.to_s)
    @itemPath="/products/"+params[:id]

    # add_breadcrumb prodCat, root_path
    add_breadcrumb "Home", root_path
    add_breadcrumb prodCat, catPath
    add_breadcrumb prodName, @itemPath
  end
end

