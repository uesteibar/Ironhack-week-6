class User < ActiveRecord::Base
  has_many :tasks, dependent: :destroy

  validates_presence_of :name, :email
  validates_uniqueness_of :name, :email
end
