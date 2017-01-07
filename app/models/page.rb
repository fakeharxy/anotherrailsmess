class Page < ApplicationRecord
  has_many :paragraphs

  def count
    paragraphs.count + 1
  end

end
