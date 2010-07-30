class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :comments, :as => :commentable
  acts_as_voteable
  validates_presence_of :body
  versioned
end
