class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true
  # validates :user, uniqueness: true
  # validates :voteable, uniqueness: true

end
