class AddLastseenToParagraph < ActiveRecord::Migration[5.0]
  def change
    add_column :paragraphs, :lastseen, :date
  end
end
