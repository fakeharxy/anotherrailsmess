class AddFieldNameToParagraphs < ActiveRecord::Migration[5.0]
  def change
    add_column :paragraphs, :lastseen, :datetime
  end
end
