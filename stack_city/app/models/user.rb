class User < ActiveRecord::Base
  has_secure_password
  has_many :answers
  has_many :questions
  has_many :votes
  has_many :favorites
  has_many :favorite_question, through: :favorites

  validates :username, presence: true
  validates :email, presence: true
  validates :password,
end
