class User < ApplicationRecord
  has_many :stories

  validates_presence_of :username, :email
  validates_uniqueness_of :email

end
