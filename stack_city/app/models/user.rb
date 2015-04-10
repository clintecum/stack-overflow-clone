class User < ActiveRecord::Base
  has_secure_password
  has_many :answers
  has_many :questions
  has_many :votes
  has_many :favorites
  has_many :favorite_question, through: :favorites

  validates :username, :email, :password, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  # def voted_once
  #   #if a user has voted on either a comment, a question, or and answer one time already, they can not vote again.
  # end

end
