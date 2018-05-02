class CreateCollabSpaceListings < ActiveRecord::Migration[5.1]
  def change
    create_table :collab_space_listings do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :brief_description
      t.text :description
      t.text :rules
      t.text :surrounding_area_description
      t.float :overall_rating
      t.float :cost_per_day
      

      t.timestamps
    end
  end
end
