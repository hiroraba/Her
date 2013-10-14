class CreateTodolists < ActiveRecord::Migration
  def change
    create_table :todolists do |t|
      t.string :content
      t.integer :priority

      t.timestamps
    end
  end
end
