class AddNewDayToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :new_day, :date
  end
end
