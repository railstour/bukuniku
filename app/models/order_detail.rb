class OrderDetail < ActiveRecord::Base
  belongs_to :order
  belongs_to :book
  validates :quantity, numericality: { greater_than: 0, only_integer: true}
end
