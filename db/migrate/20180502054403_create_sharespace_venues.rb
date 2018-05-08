class CreateSharespaceVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :sharespace_venues do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :brief_description
      t.text :description
      t.text :rules
      t.integer :overall_rating
      t.text :surrounding_area_description
      t.integer :profile_photo


      t.timestamps
    end
  end
end
