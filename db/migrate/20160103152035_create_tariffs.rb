class CreateTariffs < ActiveRecord::Migration
  def change
    create_table :tariffs, id: false do |t|
      t.string :checkout_id, null: false
      t.string :fee_type, null: false
      t.integer :gross_amount, null: false # in cents

      t.timestamps null: false
    end

    add_index :tariffs, [:checkout_id, :fee_type], unique: true
  end
end
