class Badge < ActiveRecord::Base
  has_many :badgings
  has_many :users, :through => :badgings
end
