class ApplicationController < ActionController::Base
    before_action :load_stuff

    private
    def load_stuff
        @tag = Tag.all
        @prod = Product.all
        @category = Category.all
    end
end
