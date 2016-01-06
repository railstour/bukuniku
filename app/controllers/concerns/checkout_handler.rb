module CheckoutHandler
  extend ActiveSupport::Concern

  included do
    before_action :define_base_url
  end

  KEY_DEV_ENVIRONMENT = :devkey
  KEY_PROD_ENVIRONMENT = :prodkey
  KEY_ENVIRONMENT = KEY_DEV_ENVIRONMENT

  VeritransResult = Struct.new :redirect_url, :status_message, :status_code

  private def define_base_url
    @vt_base_url = veritrans_base_url
  end

  private def define_client_key
    @vt_client_key = checkout_client_key
  end

  def checkout_client_key
    case KEY_ENVIRONMENT
    when KEY_DEV_ENVIRONMENT then ENV["VT_DEV_CLIENT_KEY"]
    when KEY_PROD_ENVIRONMENT then ENV["VT_PROD_CLIENT_KEY"]
    end
  end

  def checkout_server_key
    case KEY_ENVIRONMENT
    when KEY_DEV_ENVIRONMENT then ENV["VT_DEV_SERVER_KEY"]
    when KEY_PROD_ENVIRONMENT then ENV["VT_PROD_SERVER_KEY"]
    end
  end

  def use_vtweb?
    true
  end

  def use_vtdirect?
    !use_vtweb?
  end

  def veritrans_base_url
    if KEY_ENVIRONMENT == KEY_DEV_ENVIRONMENT
      "https://api.sandbox.veritrans.co.id/v2"
    elsif KEY_ENVIRONMENT == KEY_PROD_ENVIRONMENT
      "https://api.veritrans.co.id/v2"
    else
      fail "Unknown environment: #{KEY_ENVIRONMENT}"
    end
  end

  def checkout_charge_url
    "#{veritrans_base_url}/charge"
  end

  def checkout_authorization_header
    "Basic #{Base64.strict_encode64(checkout_server_key)}"
  end

  def checkout_direct(charging_params)
    vt_result = VeritransResult.new

    RestClient::Request.execute(
      method: :post,
      url: checkout_charge_url,
      timeout: 40,
      open_timeout: 40,
      headers: {
        "Authorization" => checkout_authorization_header, 
        "Accept" => "application/json",
        "Content-Type" => "application/json",
        "User-Agent" => "Bukuniku"
      },
      payload: JSON.generate(charging_params)
    ) do |response, request, result|
      result = JSON.parse(response).try(:with_indifferent_access)

      vt_result.redirect_url = result[:redirect_url]
      vt_result.status_message = result[:status_message]
      vt_result.status_code = result[:status_code]
    end

    vt_result
  end
end
