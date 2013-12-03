class AddEndToTodolists < ActiveRecord::Migration
  def change
    add_column :todolists, :end, :datetime
  end
end
