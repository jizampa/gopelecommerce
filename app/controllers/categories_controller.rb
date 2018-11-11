class CategoriesController < ApplicationController
  def show

    @tag = Tag.all
    @category = Category.all
    case params[:id]
    when '1'
      @collection = Product.where('category_id = 1').all
      add_breadcrumb "Hats", "/categories/1"
    when '2'
      @collection = Product.where('category_id = 2').all
      add_breadcrumb "T-Shirts", "/categories/2"
    when '3'
      @collection = Product.where('category_id = 3').all
      add_breadcrumb "Hoodies", "/categories/3"
    else
      puts 'Alternative grading system, eh?'
    end

    
  end
end