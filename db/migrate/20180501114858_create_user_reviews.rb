class CreateUserReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :user_reviews do |t|
      t.references :user, foreign_key: true
      t.integer :rating
      t.text :review

      t.timestamps
    end
  end
end
