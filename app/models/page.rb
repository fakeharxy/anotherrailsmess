class Page < ApplicationRecord
  has_many :paragraphs

  def next_paragraph_number
    paragraphs.size + 1
  end

  def find_paragraphs_by_num(id)
    paragraphs.find_by(num: id)
  end


end
