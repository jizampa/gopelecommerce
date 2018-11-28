class ChargesController < ApplicationController
  def new
  end

  def create
      # Amount in cents
      # @amount = 500
      @amount = ((session[:total_cart])*(100))
    
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      
      )
    
      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount.to_i,
        :description => 'Rails Stripe customer',
        :currency    => 'CAD'
      )
      record_purchase()
      session[:charge] = charge
      session[:status] = charge.paid
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end

  def record_purchase
    customer = User.first
    prodcts_in_cart = Array.new()
    quantity_per_product = Array.new()
    prodcts_in_cart = session[:prodcts_in_cart] || prodcts_in_cart
    quantity_per_product = session[:quantity_per_product] || quantity_per_product
    statusId = 2

    if (session[:status])
      statusId=1
    end
    newOrder = Order.new(:user_id => customer.id,
      :status_id => statusId)
      newOrder.save!

    newOrderId = Order.last.id

    (1..prodcts_in_cart.length).each do |i| 
      prodPrice = Product.find(prodcts_in_cart[i-1]).price
      newPurchase = LineItem.new(:quantity => quantity_per_product[i-1],
        :unitPrice => prodPrice, 
        :GST => customer.province.GST,
        :PST => customer.province.PST,
        :HST => customer.province.HST,
        :product_id => prodcts_in_cart[i-1],
        :order_id => newOrderId)
        newPurchase.save!
    end
      
      session[:prodcts_in_cart] = nil
      session[:quantity_per_product] = nil
  end
end