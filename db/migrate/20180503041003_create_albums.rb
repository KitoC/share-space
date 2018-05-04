class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :name    
      t.integer :profile_photo
      t.references :albumable, polymorphic: true, index: true


      t.timestamps
    end
  end
end
