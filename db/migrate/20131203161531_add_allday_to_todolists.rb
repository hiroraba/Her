class AddAlldayToTodolists < ActiveRecord::Migration
  def change
    add_column :todolists, :allDay, :boolean
  end
end
