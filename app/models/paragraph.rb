class Paragraph < ApplicationRecord
  belongs_to :page
  validates_presence_of :body, :num

  def set_paragraph_as_important
    update(important: true)
  end

  def set_paragraph_as_todo
    update(todo: Date.today)
  end

end
