class ProductsController < ApplicationController
  def index
    @tag = Tag.all
  end

  def show
  end
end
