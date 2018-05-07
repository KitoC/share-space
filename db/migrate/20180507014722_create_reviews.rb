class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :review
      t.references :reviewable, polymorphic: true, index: true
      t.references :reference, polymorphic: true, index: true

      t.timestamps
    end
  end
end
