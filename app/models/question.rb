class Question < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :name, presence: true
  validates :content, presence: true, length: { minimum: 5 }
end
