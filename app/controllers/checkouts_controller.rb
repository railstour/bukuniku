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
    @cart.set_charging_parameters(params)
    @checkout_result = checkout(@cart.charging_parameters)

    case @checkout_result.status_code.to_s
    when '200'
      @cart.update_status(Checkout::STATUS_PAYMENT_RECEIVED)
      flash[:notice] = 'Your payment have been received.'
    when '202'
      @cart.update_status(Checkout::STATUS_WAITING_PAYMENT)
      flash[:alert] = 'Your payment is rejected by the bank'
    when '201'
      @cart.update_status(Checkout::STATUS_WAITING_PAYMENT)
      flash[:alert] = 'Your payment needs manual check, we will look at it'
    else
      fail "Unknown result code: #{@checkout_result.status_message}"
    end
  rescue => e
    puts e.message
  ensure
    render json: @checkout_result.as_json
  end

  def index
  end

  private

  def get_cart
    @cart = Checkout.where(id: session[:cart_id]).first
  end
end
