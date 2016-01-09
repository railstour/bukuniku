class CheckoutsController < ApplicationController
  include CheckoutHandler
  before_action :get_cart, only: [:new, :create]

  def new
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

  private

  def get_cart
    @cart = Checkout.where(id: session[:cart_id]).first
  end
end
