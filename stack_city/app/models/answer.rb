class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many   :votes, as: :voteable
  has_many   :comments, as: :commentable
  validate :one_best_answer
  validates :user, :question, :content,  presence: true


  def self.best
    where(best: true)
  end

  def one_best_answer
    # if this is best
    # if any other answer for this question are best
    if best && Answer.find_by(question_id: question_id, best: true)
      # then error
      errors.add(:best, "only one answer can truly be best.")
    end
  end

end
