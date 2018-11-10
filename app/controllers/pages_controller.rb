class PagesController < ApplicationController
  def show
    @pageSelected = Page.find(params[:id])
  end
end
