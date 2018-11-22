class CategoriesController < ApplicationController
  def show

    @tag = Tag.all
    @category = Category.all

    catName = Category.find(params[:id]).name

    @itemPath="/categories/"+params[:id]
    add_breadcrumb "Home", root_path
    add_breadcrumb catName, @itemPath

    @collection = Product.where('category_id = ?', params[:id]).all.page(params[:page]).per(3)

    # case params[:id]
    # when '1'
    #   @collection = Product.where('category_id = 1').all.page(params[:page]).per(3)
    #   # add_breadcrumb "Hats", "/categories/1"
    # when '2'
    #   @collection = Product.where('category_id = 2').all.page(params[:page]).per(3)
    #   # add_breadcrumb "T-Shirts", "/categories/2"
    # when '3'
    #   @collection = Product.where('category_id = 3').all.page(params[:page]).per(3)
    #   # add_breadcrumb "Hoodies", "/categories/3"
    # else
    #   puts 'Alternative grading system, eh?'
    # end

    
  end
end