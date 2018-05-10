class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.integer :street_num
      t.integer :unit_num
      t.string :street_name
      t.string :street_type
      t.string :address_type
      t.string :address_identifier
      t.string :city_suburb
      t.string :state
      t.string :postcode
      t.string :country
      t.float :latitude
      t.float :longitude
      t.references :addressable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
