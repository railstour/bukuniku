module CheckoutHandler
  extend ActiveSupport::Concern

  KEY_DEV_ENVIRONMENT = :devkey
  KEY_PROD_ENVIRONMENT = :prodkey
  KEY_ENVIRONMENT = KEY_DEV_ENVIRONMENT

  VeritransResult = Struct.new :redirect_url, :status_message, :status_code

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
end
