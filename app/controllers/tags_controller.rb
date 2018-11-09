class TagsController < ApplicationController
  def show 
    @tag = Tag.all
    @prod = Product.all
    @category = Category.all
   case params[:id]
    when '46'
      @tags = Product.where('tag_id = 46').all
    when '47'
      @tags = Product.where('tag_id = 47').all
    else
      puts 'Alternative grading system, eh?'
    end
  end
end
