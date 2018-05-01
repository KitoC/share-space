class CreateOccupations < ActiveRecord::Migration[5.1]
  def change
    create_table :occupations do |t|
      t.string :occupation
      t.references :industry, foreign_key: true

      t.timestamps
    end
  end
end
