class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
  acts_as_tagger
  acts_as_voter
  has_many :questions
  has_many :answers
  has_one :profile
  before_save :create_profile
  has_many :notifies
  private
    def create_profile
      self.profile ||= Profile.new
    end
end
