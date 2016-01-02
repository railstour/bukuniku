class Review < ActiveRecord::Base
  belongs_to :reviewer, class_name: User, foreign_key: :reviewer_id
  belongs_to :book, class_name: Book, foreign_key: :book_id

  scope :mine, proc { |reviewer| where(reviewer_id: reviewer&.id) }
  scope :not_mine, proc { |reviewer| where.not(reviewer_id: reviewer&.id) }
end
