class RemoveUserFromParagraphs < ActiveRecord::Migration[5.0]
  def change
    remove_column :paragraphs, :user_id, :reference
  end
end
