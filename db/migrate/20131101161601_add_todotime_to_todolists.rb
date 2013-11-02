class AddTodotimeToTodolists < ActiveRecord::Migration
  def change
    add_column :todolists, :todotime, :datetime
  end
end
