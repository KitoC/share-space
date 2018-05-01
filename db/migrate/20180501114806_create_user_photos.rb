class CreateUserPhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :user_photos do |t|
      t.references :user, foreign_key: true
      t.string :img_url
      t.text :description
      t.integer :position

      t.timestamps
    end
  end
end
