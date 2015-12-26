class CartsController < ApplicationController
  def create
    cart = Order.find_order(session[:cart_id])
    session[:cart_id] = cart.id

    unless is_number_and_greater_than_zero?(params[:order_detail][:quantity])
      flash[:alert] = 'quantity must be number and greater than 0'
      redirect_to :back
      return
    end

    book = Book.find(params[:order_detail][:book_id])
    order_detail = cart.add_book_to_cart(book, params[:order_detail][:quantity].to_i)

    if order_detail.valid?
      flash[:notice] = 'order added successfully'
    else
      flash[:alert] = order_detail.errors.full_messages.to_sentence
    end

    redirect_to :back
  end

  def index
    @cart = Order.find_by(id: session[:cart_id], status: 'shopping')
    if @cart.order_details.blank?
      flash[:alert] = 'Cart is Empty'
    end
  end

  private
  def is_number_and_greater_than_zero?(quantity)
    begin
      Integer(params[:order_detail][:quantity]) > 0
    rescue
      false
    end
  end
end
