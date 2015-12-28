class CreateReviewVotes < ActiveRecord::Migration
  def change
    create_table :review_votes do |t|
      t.integer :book_id, null: false
      t.integer :review_id, null: false
      t.integer :voter_id, null: false
      t.string :vote, null: false

      t.timestamps null: false
    end

    add_index :review_votes, :review_id
    add_index :review_votes, :book_id
    add_index :review_votes, :voter_id
  end
end
