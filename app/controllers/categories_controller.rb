class CategoriesController < ApplicationController
  def show

    @tag = Tag.all
    @category = Category.all
    case params[:id]
    when '1'
      @collection = Product.where('category_id = 1').all
    when '2'
      @collection = Product.where('category_id = 2').all
    when '3'
      @collection = Product.where('category_id = 3').all
    else
      puts 'Alternative grading system, eh?'
    end

    
  end
end

