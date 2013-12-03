class CreateTodolists < ActiveRecord::Migration
  def change
    create_table :todolists do |t|
      t.string :title
      t.integer :priority

      t.timestamps
    end
  end
end
