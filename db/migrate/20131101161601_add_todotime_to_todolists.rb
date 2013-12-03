class AddEndStartallDayToTodolists < ActiveRecord::Migration
  def change
    add_column :todolists, :end, :datetime
    add_column :todolists, :start, :datetime
    add_column :todolists, :allDay, :boolean
  end
end
