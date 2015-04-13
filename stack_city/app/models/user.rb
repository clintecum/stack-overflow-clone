class User < ActiveRecord::Base
  has_secure_password
  has_many :answers
  has_many :questions
  has_many :votes
  has_many :favorites
  has_many :favorite_question, through: :favorites
  has_many :comments
  has_many :commentables, through: :comments
  accepts_nested_attributes_for :commentables

  validates :username, :email, :password, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }



end
