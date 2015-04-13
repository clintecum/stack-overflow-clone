class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: :true
  has_many   :votes, as: :voteable
  accepts_nested_attributes_for :commentable
end
