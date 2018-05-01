class CreateLocationAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :location_addresses do |t|
      t.string :city_suburb
      t.string :state
      t.string :country
      t.integer :postcode

      t.timestamps
    end
  end
end
