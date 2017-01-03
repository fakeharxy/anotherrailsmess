class AddForeignkeyToParagraphs < ActiveRecord::Migration[5.0]
  def change
      add_index :paragraphs, :page_id
  end
end
