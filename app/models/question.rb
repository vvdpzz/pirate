class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, :dependent => :destroy
  has_many :comments, :as => :commentable, :dependent => :destroy
  acts_as_voteable
  acts_as_taggable
  acts_as_taggable_on :tags
  versioned
  validates_presence_of :title, :body
  
  cattr_reader :per_page
  @@per_page = 30
  
  # def to_param
  #   "#{id}-#{title.gsub(" ","-")}"
  #   # filter bug e.g. ?*&%^$%$#@!~!
  # end
end
