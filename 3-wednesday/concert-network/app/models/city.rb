class City < ActiveRecord::Base
  has_many :concerts
  
  validates_presence_of :name
  validates_uniqueness_of :name
end
