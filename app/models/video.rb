class Video < ActiveRecord::Base
  belongs_to :user
  has_one :slot
  has_many :likes, counter_cache: true
end
