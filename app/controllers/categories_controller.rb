# frozen_string_literal: true

class CategoriesController < ApplicationController
  def show
    @tag = Tag.all
    @category = Category.all
    cat_name = Category.find(params[:id]).name
    @item_path = '/categories/' + params[:id]
    add_breadcrumb 'Home', root_path
    add_breadcrumb cat_name, @item_path
    @collection = Product.where('category_id = ?', params[:id]).all.page(params[:page]).per(3)
  end
end
