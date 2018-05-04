class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.integer :rating
      t.text :review
      t.references :reviewable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
