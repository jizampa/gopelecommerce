class PagesController < ApplicationController
  def show
    @pageSelected = Page.find(params[:id])
    
    @itemPath="/pages/"+params[:id]
    add_breadcrumb "Home", root_path
    add_breadcrumb @pageSelected.name, @itemPath
    # if params[:id] == "1"
    #   add_breadcrumb "Home", root_path
    #   add_breadcrumb "AboutUs","/pages/1"
    # elsif params[:id] == "2"
    #   @test= "/pages/2"
    #   add_breadcrumb "Home", root_path
    #   add_breadcrumb "ContactUs", @test
    # end
  end
end
