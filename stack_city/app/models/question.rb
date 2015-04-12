class Question < ActiveRecord::Base
  belongs_to :user
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable
  has_many :answers
  has_many :favorites
  has_one  :best_answer, class_name: "Answer"
  validates :user, :body, :title,  presence: true

  validate :voted_once

  def voted_once
    users = []
    votes.each do |vote|
      users << vote.user.id
    end
    unless users.detect {|e| users.count(e) > 1}
      return true
    end
  end

  def best_answer
    answers.best.first
  end

  def self.vote_count
    votes = []
    self.all.each do |question|
      question.votes.each do |vote|
        votes << vote
      end
    end
    votes.count
  end

end
