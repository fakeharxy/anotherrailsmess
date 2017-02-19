class AddUserToParagraphs < ActiveRecord::Migration[5.0]
  def change
    add_reference :paragraphs, :user, foreign_key: true
  end
end
