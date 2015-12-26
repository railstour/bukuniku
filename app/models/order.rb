class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_details

  validates_inclusion_of :status, in: ['shopping']

  before_save :set_total_price

  def set_total_price
    self.total_price = order_details.sum('unit_price * quantity')
  end

  def self.find_order(id)
    if id.present?
      order = find_by(id: id, status: 'shopping')
      if order.blank?
        order = create(status: 'shopping')
      end
    else
      order = create(status: 'shopping')
    end
    order
  end

  def add_book_to_cart(book, quantity)
    order_detail = order_details.find_or_initialize_by(book: book)
    order_detail.quantity = order_detail.quantity.to_i + quantity
    order_detail.save
    order_detail
  end
end
