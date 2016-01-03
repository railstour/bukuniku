class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_details

  STATUS_SHOPPING = 'shopping'
  STATUS_CANCELLED = 'cancelled'
  STATUS_WAITING_PAYMENT = 'waiting_payment'
  STATUS_PAYMENT_RECEIVED = 'payment_received'
  STATUS_PROCESSED = 'processed'
  STATUS_OTW = 'otw'
  STATUS_RECEIVED = 'received'

  ALL_STATUS = [
    STATUS_SHOPPING,
    STATUS_CANCELLED,
    STATUS_WAITING_PAYMENT,
    STATUS_PAYMENT_RECEIVED,
    STATUS_PROCESSED,
    STATUS_OTW,
    STATUS_RECEIVED
  ]

  validates_inclusion_of :status, in: ALL_STATUS

  before_save :set_total_price

  def set_total_price
    self.total_price = order_details.sum('unit_price * quantity')
  end

  def self.find_order(id)
    if id.present?
      order = find_by(id: id, status: STATUS_SHOPPING)
      if order.blank?
        order = create(status: STATUS_SHOPPING)
      end
    else
      order = create(status: STATUS_SHOPPING)
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
