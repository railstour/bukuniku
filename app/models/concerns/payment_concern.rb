module PaymentConcern
  extend ActiveSupport::Concern

  def update_status(status)
    update_attributes(status: status)
  end
end
