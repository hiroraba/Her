class AddStartToTodolists < ActiveRecord::Migration
  def change
    add_column :todolists, :start, :datetime
  end
end
