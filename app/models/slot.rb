class Slot < ActiveRecord::Base
  belongs_to :user
  has_one :video
end
