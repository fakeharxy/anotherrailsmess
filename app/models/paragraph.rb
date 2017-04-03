class Paragraph < ApplicationRecord
  belongs_to :page
  acts_as_taggable
  validates_presence_of :body, :num

  def switch_paragraphs_importance
    important == true ? update(important: nil) : update(important: true)
    set_lastseen_as_now
  end

  def apply_tag_or_tags(tags)
    tag_list.add(tags)
    save
  end

  def set_paragraph_as_todo(date)
    update(todo: date)
  end

  def set_lastseen_as_now
    update(lastseen: DateTime.now)
  end

  def remove_todo
    update(todo: nil)
  end
end
