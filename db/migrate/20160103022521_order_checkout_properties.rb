class OrderCheckoutProperties < ActiveRecord::Migration
  def change
    change_table(:orders) do |t|
      t.string :recipient_first_name  # must exist, when checkout
      t.string :recipient_last_name   # must exist, when checkout
      t.string :recipient_company     # really optional
      t.text :recipient_address       # must exist, when checkout
      t.string :recipient_city        # must exist, when checkout
      t.string :recipient_postcode    # must exist, when checkout
      t.string :recipient_country     # must exist, when checkout
      t.string :recipient_province    # must exist, when checkout
      t.string :recipient_phone       # really optional
      t.string :recipient_email       # really optional

      t.string :billing_first_name    # must exist, when checkout
      t.string :billing_last_name     # must exist, when checkout
      t.text :billing_address         # must exist, when checkout
      t.string :billing_phone         # must exist, when checkout
      t.string :billing_email         # must exist, when checkout
      t.text :special_note

      t.string :co_gateway            # veritrans
      t.string :co_channel            # credit_card, bri_epay, or else
      t.string :co_id                 # checkout_id
      t.timestamp :co_time            # checkout_time
      t.integer :co_amount            # checkout_amount
    end
  end
end
