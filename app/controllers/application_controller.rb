class ApplicationController < ActionController::Base
    @tag = Tag.all
    @prod = Product.all
    @category = Category.all
end
