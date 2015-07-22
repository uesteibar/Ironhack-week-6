class User < ActiveRecord::Base
  validates_presence_of :username, :email, :password_digest
  validates_uniqueness_of :username, :email
end
