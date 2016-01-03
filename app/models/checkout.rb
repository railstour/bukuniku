# Checkout inherits Order but with an enforced variables relating to 
# a checkout process
class Checkout < Order
  alias_attribute :checkout_gateway, :co_gateway
  alias_attribute :checkout_channel, :co_channel
  alias_attribute :checkout_id, :co_id
  alias_attribute :checkout_time, :co_time
  alias_attribute :checkout_amount, :co_amount
  
  validates_presence_of :billing_address, :recipient_address
  validates_presence_of :billing_phone, :recipient_phone
  validates_presence_of :billing_email, :recipient_email
  validates_presence_of :checkout_amount, if: -> { status != STATUS_SHOPPING }

  before_save :assign_checkout_time

  private

  def assign_checkout_time
    if checkout_time.blank? && status == WAITING_PAYMENT
      self.checkout_time = DateTime.now 
    end
  end
end
