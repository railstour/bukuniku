ActiveAdmin.register Order do
  actions :all, :except => [:new, :destroy]
  index do
    id_column
    column :recipient_email
    column :price
    column :status
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs 'detail' do
      f.input :status, as: :select, collection: Order::ALL_STATUS, include_blank: false
      f.input :special_note
    end

    f.inputs 'billing' do
      f.input :billing_first_name
      f.input :billing_last_name
      f.input :billing_address
      f.input :billing_phone
      f.input :billing_email
    end

    f.inputs 'Recipient' do
      f.input :recipient_first_name
      f.input :recipient_last_name
      f.input :recipient_company
      f.input :recipient_address
      f.input :recipient_city
      f.input :recipient_postcode
      # f.input :recipient_country
      f.input :recipient_province
      f.input :recipient_phone
      f.input :recipient_email
    end
    f.actions
  end

  show do |order|
    attributes_table do
      row :id
      row :total_price
      row :status
      row :created_at
      row :updated_at
      row :special_note
      row :co_gateway
      row :co_channel
      row :co_id
      row :co_time
      row :co_amount
    end

    columns do
      column do
        panel 'billing' do
          attributes_table_for order do
            row :billing_first_name
            row :billing_last_name
            row :billing_address
            row :billing_phone
            row :billing_email
          end
        end
      end
      column do
        panel "recipient" do
          attributes_table_for order do
            row :recipient_first_name
            row :recipient_last_name
            row :recipient_company
            row :recipient_address
            row :recipient_city
            row :recipient_postcode
            row :recipient_country
            row :recipient_province
            row :recipient_phone
            row :recipient_email
          end
        end
      end
    end #columns

    panel 'Order Detail' do
      order_details = order.order_details
      table_for order_details do
        column('Book') { |order_detail| link_to order_detail.book.title, admin_book_path(order_detail.book)  }
        column('Quantity') { |order_detail| order_detail.quantity }
        column('Unit Price') { |order_detail| order_detail.unit_price }
      end
    end
  end
end
