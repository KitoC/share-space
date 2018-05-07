class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :category
      t.references :sharespace_venue, foreign_key: true

      t.timestamps
    end
  end
end
