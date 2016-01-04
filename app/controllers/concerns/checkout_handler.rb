module CheckoutHandler
  extend ActiveSupport::Concern

  KEY_DEV_ENVIRONMENT = :devkey
  KEY_PROD_ENVIRONMENT = :prodkey
  KEY_ENVIRONMENT = KEY_DEV_ENVIRONMENT

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
end
