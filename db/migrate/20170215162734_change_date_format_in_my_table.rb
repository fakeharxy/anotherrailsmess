class ChangeDateFormatInMyTable < ActiveRecord::Migration[5.0]
  def change
    def up
      change_column :paragraphs, :lastseen, :datetime
    end

    def down
      change_column :paragraphs, :lastseen, :date
    end
  end
end
