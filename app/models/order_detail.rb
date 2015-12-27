class OrderDetail < ActiveRecord::Base
  belongs_to :order
  belongs_to :book
  validates :quantity, numericality: { greater_than: 0, only_integer: true}
  before_save :set_unit_price
  after_save :update_price_orders
  after_destroy :update_price_orders

  def set_unit_price
    self.unit_price = book.price
  end

  def update_price_orders
    if order.present?
      order.set_total_price
      order.save
    end
  end
end
