# frozen_string_literal: true

class PagesController < ApplicationController
  def show
    @page_selected = Page.find(params[:id])

    @item_path = '/pages/' + params[:id]
    add_breadcrumb 'Home', root_path
    add_breadcrumb @page_selected.name, @item_path
  end
end
