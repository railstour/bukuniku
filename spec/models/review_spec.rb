require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:user) {
    User.create(
      name: 'Test User',
      email: 'test@example.com',
      password: 'Password01'
    )
  }

  let(:book) {
    Book.create(
      title: 'Test Book',
      price: '1000',
      quantity: 5
    )
  }

  let(:review) {
    Review.create(
      reviewer: user,
      book: book,
      star: 3,
      text: 'Sample'
    )
  }

  it 'has reference to book' do
    expect(book).to be_persisted
    expect(review).to be_persisted
    expect(review.book).to_not be_nil
    expect(review.book).to be_a Book
    expect(review.book).to be book
  end

  it 'has reference to reviewer' do
    expect(user).to be_persisted
    expect(review).to be_persisted
    expect(review.reviewer).to_not be_nil
    expect(review.reviewer).to be_a User
    expect(review.reviewer).to be user
  end
end
