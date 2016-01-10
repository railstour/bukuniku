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
    begin
      @cart.set_charging_parameters(params)
      @cart.save!
    rescue => e
      puts "Error while updating cart: #{e.message}"
    end

    @checkout_result = checkout_direct(
      @cart.charging_parameters.tap do |charging_params|
        charging_params[:payment_type] = 'credit_card'
        charging_params[:credit_card]= {
          token_id: params[:credit_card][:token]
        }
      end
    )

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
    puts e.backtrace
  ensure
    render json: @checkout_result.as_json
  end

  def index
  end

  def callback
    checkout_id = params.fetch(:order_id)
    status_code = params.fetch(:status_code)
    transaction_status = params.fetch(:transaction_status)

    checkout = Checkout.for_user(current_user).where(co_id: checkout_id).first

    if checkout &&
        status_code.to_s == '200' &&
        transaction_status.to_s.downcase == 'capture'
      checkout.update_status(Checkout::STATUS_PAYMENT_RECEIVED)
      redirect_to root_path, notice: "Your payment have been received"
    else
      checkout.update_status(Checkout::STATUS_WAITING_PAYMENT)
      redirect_to root_path, alert: "Cannot process your payment"
    end
  end

  private

  def get_cart
    @cart = Checkout.where(id: session[:cart_id]).first
  end
end
