class RemoveFieldNameFromParagraphs < ActiveRecord::Migration[5.0]
  def change
    remove_column :paragraphs, :lastseen, :date
  end
end
