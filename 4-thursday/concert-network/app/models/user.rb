class User < ActiveRecord::Base
  validates_presence_of :username, :email, :password_digest
  validates_uniqueness_of :username, :email
  has_secure_password

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    unless self.role
      self.role = :user
    end
  end
end
