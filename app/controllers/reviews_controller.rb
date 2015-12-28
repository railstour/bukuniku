class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    text = params[:review][:text]
    book_id = params[:review][:book_id]
    book = Book.find(book_id)

    review = Review.new(
      text: text,
      book: book,
      reviewer: current_user,
      star: 5,
    )

    review.save!
    redirect_to book, notice: "Review has been posted"
  rescue => e
    redirect_to book, alert: "Unable to post your review"
  end
end
