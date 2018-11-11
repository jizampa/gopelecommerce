class TagsController < ApplicationController
  def show 
    
    


    @tag = Tag.all
    @prod = Product.all
    @category = Category.all
   case params[:id]
    when '46'
      @tags = Product.where('tag_id = 46').all
      add_breadcrumb "Home", "/"
      add_breadcrumb "Sale", "/tags/46"
    when '47'
      @tags = Product.where('tag_id = 47').all
      add_breadcrumb "Home", "/"
      add_breadcrumb "Clearance", "/tags/47"
    else
      puts 'Alternative grading system, eh?'
    end
  end
end


  