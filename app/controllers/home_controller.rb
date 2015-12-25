class HomeController < ApplicationController
  def index
    @books = Book.limit(12)
  end
end
