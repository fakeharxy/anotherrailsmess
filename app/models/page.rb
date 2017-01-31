class Page < ApplicationRecord
  has_many :paragraphs

  def next_paragraph_number
    paragraphs.size + 1
  end

  def find_paragraph_by_num(id)
    paragraphs.find_by(num: id)
  end

  def set_title(title)
    update(title: title)
  end

end
