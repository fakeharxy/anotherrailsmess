class Paragraph < ApplicationRecord
  belongs_to :page
  validates_presence_of :body, :num

  def set_paragraph_as_important
    update(important: true)
    set_lastseen_as_now
  end

  def set_paragraph_as_todo(date)
    update(todo: date)
  end

  def set_lastseen_as_now
    update(lastseen: DateTime.now)
  end
end
