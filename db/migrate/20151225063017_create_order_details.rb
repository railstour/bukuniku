class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.references :book, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
      t.integer :quantity
      t.integer :unit_price
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
