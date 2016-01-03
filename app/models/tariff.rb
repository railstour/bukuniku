class Tariff < ActiveRecord::Base
  belongs_to :checkout, class_name: Checkout, foreign_key: :checkout_id

  TAX = 'tax'
  SHIPPING_FEE = 'shipfee'

  ALL_FEES = [
    TAX,
    SHIPPING_FEE
  ]

  validates_presence_of :checkout_id
  validates_presence_of :gross_amount
  validates_inclusion_of :fee_type, in: ALL_FEES

  scope :fee_type, proc { |fee_type| where(fee_type: fee_type) }
end
