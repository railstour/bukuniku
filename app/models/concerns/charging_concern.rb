module ChargingConcern
  extend ActiveSupport::Concern

  included do
    validates_presence_of :billing_address, :recipient_address
    validates_presence_of :billing_phone, :recipient_phone
    validates_presence_of :billing_email, :recipient_email
    validates_presence_of :checkout_amount, if: -> { 
      status != Checkout::STATUS_SHOPPING }

    before_save :assign_checkout_time
    after_save :calculate_shipping_fee
    after_save :calculate_tax_fee
  end

  # calculate the final price that is total price and all of its tariffs
  def total_price_with_tariffs
    (tariffs.all.sum(:gross_amount) / 100) + total_price
  end

  private

  def assign_checkout_time
    if checkout_time.blank? && status == Checkout::WAITING_PAYMENT
      self.checkout_time = DateTime.now 
    end
  end

  def calculate_shipping_fee
    shipping_fee = tariffs.fee_type(Tariff::SHIPPING_FEE).first_or_initialize
    shipping_fee.gross_amount = 10_000_00 # fee is in cents
    shipping_fee.save!
  end

  def calculate_tax_fee
    tax_fee = tariffs.fee_type(Tariff::TAX).first_or_initialize
    tax_fee.gross_amount = (3.7 * 100) * total_price
    tax_fee.save!
  end
end
