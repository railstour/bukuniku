class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :book_id, null: false
      t.integer :reviewer_id, null: false
      t.decimal :star, null: false
      t.text :text, null: false

      # review could be replied
      t.integer :replied_review_id

      t.timestamps null: false
    end

    # can fastly search reviews for a book
    add_index :reviews, :book_id

    # can display reviews made by a user
    add_index :reviews, :reviewer_id
  end
end
