class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, :polymorphic => true
  acts_as_voteable
  validates_presence_of :body
end
