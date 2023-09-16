class User < ApplicationRecord
  has_secure_password

  has_many :records, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def already_favorited?(question)
    favorites.exists?(question_id: question.id)
  end
end
