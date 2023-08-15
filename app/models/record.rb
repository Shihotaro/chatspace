class Record < ApplicationRecord
  belongs_to :user

  validates :date, presence: true
  validates :body_temperature, presence: true
  validates :weight, presence: true
  validates :body_fat_percentage, presence: true
  validates :condition, presence: true
  validates :memo, presence: true
end
