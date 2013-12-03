class RemoveTodotimeFromTodolists < ActiveRecord::Migration
  def change
    remove_column :todolists, :todotime
  end
end
