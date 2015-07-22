class Comment < ActiveRecord::Base
  belongs_to :concert, counter_cache: true

  validates_presence_of :username, :content
end
