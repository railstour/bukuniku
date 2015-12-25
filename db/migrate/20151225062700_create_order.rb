class CreateOrder < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :total_price
      t.references :user, index: true, foreign_key: true
      t.string :status
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
