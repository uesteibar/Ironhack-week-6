class Tournament < ActiveRecord::Base
  has_many :registrations
  has_many :users, through: :registrations

  validates_presence_of :name
  validates_uniqueness_of :name
end
