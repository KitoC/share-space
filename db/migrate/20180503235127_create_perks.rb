class CreatePerks < ActiveRecord::Migration[5.1]
  def change
    create_table :perks do |t|
      t.string :perk
      t.references :sharespace_venue, foreign_key: true

      t.timestamps
    end
  end
end
