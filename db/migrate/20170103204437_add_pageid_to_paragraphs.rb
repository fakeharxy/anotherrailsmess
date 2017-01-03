class AddPageidToParagraphs < ActiveRecord::Migration[5.0]
  def change
    add_column :paragraphs, :page_id, :integer
  end
end
