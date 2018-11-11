class PagesController < ApplicationController
  def show
    @pageSelected = Page.find(params[:id])
    
    if params[:id] == "1"
      add_breadcrumb "AboutUs","/pages/1"
    elsif params[:id] == "2"
      add_breadcrumb "ContactUs","/pages/2"
    end
  end
end
