class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  acts_as_tagger
  has_many :pages
  has_many :paragraphs, through: :pages

  def apply_tag_or_tags(tags, paragraph)
    tags.split(',').each do |current_tag|
      tag(paragraph, :with => current_tag, :on => :tags)
    end
    save
  end

end
