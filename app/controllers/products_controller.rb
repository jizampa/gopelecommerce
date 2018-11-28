# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    add_breadcrumb 'home', '/'

    @product = (Product.where('name LIKE ?', "%#{params[:term]}%") if params[:term])

    @fearured_product1 = Product.where('category_id = 1').sample
    @fearured_product2 = Product.where('category_id = 2').sample
    @fearured_product3 = Product.where('category_id = 3').sample
    @product_searched = Product.where('title LIKE ? AND category_id = ?', "%#{params[:term]}%", params[:cat_id])
    @idsearched = params[:cat_id]
  
    @test
  end

  def show
    @product = Product.find(params[:id])
    prod_name = @product.title
    prod_cat = @product.category.name
    catid = @product.category.id
    cat_path = '/categories/' + catid.to_s
    @item_path = '/products/' + params[:id]
    add_breadcrumb 'Home', root_path
    add_breadcrumb prod_cat, cat_path
    add_breadcrumb prod_name, @item_path
  end

  def cart

    @total_price = 0
    @prodcts_in_cart = Array.new()
    @quantity_per_product = Array.new()
    @prodcts_in_cart = session[:prodcts_in_cart] || @prodcts_in_cart
    @quantity_per_product = session[:quantity_per_product] || @quantity_per_product
    @total_price = session[:total_cart] || @total_price
    @products_obj = Product.find(@prodcts_in_cart)
    @count = @prodcts_in_cart.count


  end

  def add_to_cart
    prams = params[:id].to_i
    @prodcts_in_cart = Array.new()
    @quantity_per_product = Array.new()
    @prodcts_in_cart = session[:prodcts_in_cart] || @prodcts_in_cart
    @quantity_per_product = session[:quantity_per_product] || @quantity_per_product

    if @prodcts_in_cart.include?(prams)
      prod_index = @prodcts_in_cart.index(prams)
      @quantity_per_product[prod_index] +=1
    else
      @prodcts_in_cart << prams
      @quantity_per_product << 1
    end
    session[:prodcts_in_cart] = nil
    session[:quantity_per_product] = nil
    session[:prodcts_in_cart] =  @prodcts_in_cart
    session[:quantity_per_product] = @quantity_per_product
    update_total()
    redirect_to "/cart"
  end

  def delete_from_cart
    prasm = params[:id].to_i
    @prodcts_in_cart = Array.new()
    @quantity_per_product = Array.new()
    @prodcts_in_cart = session[:prodcts_in_cart] || @prodcts_in_cart
    @quantity_per_product = session[:quantity_per_product] || @quantity_per_product
    prod_index = @prodcts_in_cart.index(prasm)
    @quantity_per_product[prod_index] -= 1

    if @quantity_per_product[prod_index] <= 0
      @quantity_per_product.delete_at(prod_index)
      @prodcts_in_cart.delete_at(prod_index)
    end
    session[:prodcts_in_cart] = nil
    session[:quantity_per_product] = nil
    session[:prodcts_in_cart] =  @prodcts_in_cart
    session[:quantity_per_product] = @quantity_per_product
    update_total()
    redirect_to "/cart"

  end

  def clear_cart
    session[:prodcts_in_cart] = nil
    session[:quantity_per_product] = nil
    update_total()
    redirect_to "/cart"
  end

  def update_total
    @total_price = 0
    @prodcts_in_cart = Array.new()
    @quantity_per_product = Array.new()
    @prodcts_in_cart = session[:prodcts_in_cart] || @prodcts_in_cart
    @quantity_per_product = session[:quantity_per_product] || @quantity_per_product

    (1..@prodcts_in_cart.length).each do |i| 
      @total_price += (Product.find(@prodcts_in_cart[i-1]).price)*(@quantity_per_product[i-1])
    end
    session[:total_cart] = @total_price
    
  
  end
  
  def product_params
    params.require(:product).permit(:term)
  end
end
