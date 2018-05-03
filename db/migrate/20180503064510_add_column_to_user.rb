class AddColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :profile_photo, :integer
  end
end
