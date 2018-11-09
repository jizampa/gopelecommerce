class ApplicationController < ActionController::Base
    before_action :load_variables

    private
    def load_variables
        @tag = Tag.all
        @prod = Product.all
        @category = Category.all
        @page = Page.all
    end
end
