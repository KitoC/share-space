class AddColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :dob, :date
    add_column :users, :phone_number, :integer
    add_column :users, :street_address, :string
    add_column :users, :description, :text
    add_column :users, :overall_rating, :integer
    add_column :users, :emergency_contact_name, :string
    add_column :users, :emergency_contact_number, :integer
    add_column :users, :emergency_contact_relationship, :string
    add_column :users, :gender, :string
    add_reference :users, :occupation, foreign_key: true
    add_reference :users, :address, foreign_key: true
  end
end
