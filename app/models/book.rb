class Book < ActiveRecord::Base
  validates_presence_of :title, :price
  validates_numericality_of :quantity, greater_than_or_equal_to: 0
end
