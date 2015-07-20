class User < ActiveRecord::Base
  has_many :registrations
  has_many :tournaments, through: :registrations

  validates_presence_of :name
  validates_uniqueness_of :name
end
