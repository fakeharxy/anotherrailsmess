class Paragraph < ApplicationRecord
  belongs_to :page
  validates_presence_of :body, :num
end
