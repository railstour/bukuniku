module ChargingParametersConcern
  extend ActiveSupport::Concern

  VALUE_IS_BLANK = proc { |key, value| value.blank? } 

  def charging_parameters
    data = {}.with_indifferent_access

    data[:transaction_details] = {
      order_id: id,
      gross_amount: total_price 
    }

    data[:item_details] = tdc_item_details
    data[:customer_details] = tdc_customer_details

    data.delete_if(&VALUE_IS_BLANK)
  end

  def set_charging_parameters(params)
    params[:checkout].tap do |form|
      self.recipient_first_name = form[:recipient_first_name]
      self.recipient_last_name = form[:recipient_last_name]
      self.recipient_email = form[:recipient_email]
      self.recipient_company = form[:recipient_company]
      self.recipient_address = form[:recipient_address]
      self.recipient_city = form[:recipient_city]
      self.recipient_phone = form[:recipient_phone]
      self.billing_first_name = form[:billing_first_name]
      self.billing_last_name = form[:billing_last_name]
      self.billing_phone = form[:billing_phone]
      self.billing_email = form[:billing_email]
      self.billing_address = form[:billing_address]
      self.special_note = form[:special_note]
    end

    if params[:direct]
      if params[:direct] && params[:direct][:credit_card]
        self.co_gateway = 'veritrans'
        self.co_channel = 'credit_card'
      end
    end # if direct
  end

  private

  def tdc_item_details
    order_details.map do |order_detail|
      book = order_detail.book

      # mapped to a hash
      {
        id: book.id,
        price: book.price,
        quantity: order_detail.quantity,
        name: book.title 
      }
    end
  end

  def tdc_customer_details
    customer_details = {
      first_name: recipient_first_name,
      last_name: recipient_last_name,
      email: recipient_email,
      phone: recipient_phone,
      
      billing_address: {
        first_name: billing_first_name,
        last_name: billing_last_name,
        phone: billing_phone 
      }.delete_if(&VALUE_IS_BLANK),

      shipping_address: {
        first_name: recipient_first_name,
        last_name: recipient_last_name,
        phone: recipient_phone
      }.delete_if(&VALUE_IS_BLANK)
    }.delete_if(&VALUE_IS_BLANK)
  end
end
