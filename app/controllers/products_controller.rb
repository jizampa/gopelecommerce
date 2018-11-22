class ProductsController < ApplicationController

  def index
  add_breadcrumb "home", "/"

  @product = if params[:term]
    Product.where('name LIKE ?', "%#{params[:term]}%")
  end
   
    @fearured_product1 = Product.where('category_id = 1').sample
    @fearured_product2 = Product.where('category_id = 2').sample
    @fearured_product3 = Product.where('category_id = 3').sample
    
    @productSearched = Product.where("name LIKE ?", "%#{params[:term]}%")
    @productSearchedCount = Product.where("title LIKE ? AND category_id = ?", "%#{params[:term]}%", params[:cat_id] )

    

    @idsearched = params[:cat_id]

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
  def product_params
    params.require(:product).permit(:term)
  end
end

