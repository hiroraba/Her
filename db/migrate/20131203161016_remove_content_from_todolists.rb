class RemoveContentFromTodolists < ActiveRecord::Migration
  def change
    remove_column :todolists, :content, :string
  end
end
