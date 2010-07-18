class Question < ActiveRecord::Base
  belongs_to :user
  acts_as_taggable
  acts_as_taggable_on :tags
  versioned
  def to_param
    "#{id}-#{title.gsub(" ","-")}"
  end
end
