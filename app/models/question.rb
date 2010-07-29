class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :comments, :as => :commentable
  acts_as_voteable
  acts_as_taggable
  acts_as_taggable_on :tags
  versioned
  validates_presence_of :title, :body
  
  # def to_param
  #   "#{id}-#{title.gsub(" ","-")}"
  #   # filter bug e.g. ?*&%^$%$#@!~!
  # end
end
