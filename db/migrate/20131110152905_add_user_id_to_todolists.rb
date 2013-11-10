class AddUserIdToTodolists < ActiveRecord::Migration
  def change
    add_column :todolists, :user_id, :integer
    add_index :todolists, :user_id
  end
end
