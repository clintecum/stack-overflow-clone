class Question < ActiveRecord::Base
  belongs_to :user
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable
  has_many :answers
  has_many :favorites
  has_one  :best_answer, class_name: "Answer"

  def best_answer
    answers.best.first
  end

end
