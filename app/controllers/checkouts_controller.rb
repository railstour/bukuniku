class CheckoutsController < ApplicationController
  include CheckoutHandler

  def new
    @cart = Checkout.where(id: session[:cart_id]).first

    if @cart
      render layout: 'plain'
    else
      redirect_to root_path, alert: "You haven't put anything into your cart"
    end
  end

  def create
  end

  def index
  end
end
