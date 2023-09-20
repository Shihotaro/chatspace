class Question < ApplicationRecord
  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :question_tags, dependent: :destroy
  has_many :tags, through: :question_tags

  validates :title, presence: true, length: { maximum: 30 }
  validates :name, presence: true
  validates :content, presence: true, length: { minimum: 5 }

  def save_tags(tags)
    tags.each do |name|
      tag = Tag.find_or_create_by(name: name)
      self.tags << tag
    end
  end
end
