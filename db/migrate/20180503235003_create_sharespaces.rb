class CreateSharespaces < ActiveRecord::Migration[5.1]
  def change
    create_table :sharespaces do |t|
      t.string :space_type
      t.text :description
      t.float :cost
      t.integer :overall_rating
      t.integer :profile_photo
      t.references :sharespace_venue, foreign_key: true

      t.timestamps
    end
  end
end
