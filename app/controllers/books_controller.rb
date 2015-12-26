class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
    @order_detail = OrderDetail.new
  end
end
