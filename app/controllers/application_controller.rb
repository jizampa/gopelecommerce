# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :load_variables

  private

  def load_variables
    @tag = Tag.all
    @prod = Product.all
    @category = Category.all
    @page = Page.all
  end

  def index
    add_breadcrumb 'index', index_path
  end
  #   def index
  #     add_breadcrumb "index", index_path, :title => "Back to the Index"
  #   end
end
