# Checkout inherits Order but with an enforced variables relating to 
# a checkout process
class Checkout < Order
  include ChargingParametersConcern
  include ChargingConcern
  include PaymentConcern

  alias_attribute :checkout_gateway, :co_gateway
  alias_attribute :checkout_channel, :co_channel
  alias_attribute :checkout_id, :co_id
  alias_attribute :checkout_time, :co_time
  alias_attribute :checkout_amount, :co_amount

  has_many :tariffs, class_name: Tariff
end
