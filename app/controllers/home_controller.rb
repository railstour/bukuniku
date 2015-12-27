class HomeController < ApplicationController
  def index
    @books = Book.limit(12)
    @order_detail = OrderDetail.new
  end
end
