class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.date :date_from
      t.date :date_to
      t.integer :total_days
      t.float :total_cost
      t.datetime :date_paid
      t.boolean :paid
      t.string :description   
      t.belongs_to :user, index: true
      t.belongs_to :share_space, index: true

      t.timestamps
    end
  end
end
