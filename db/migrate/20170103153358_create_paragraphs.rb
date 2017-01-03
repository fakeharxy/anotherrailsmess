class CreateParagraphs < ActiveRecord::Migration[5.0]
  def change
    create_table :paragraphs do |t|
      t.text :body
      t.integer :num
      t.boolean :important
      t.date :todo

      t.timestamps
    end
  end
end
