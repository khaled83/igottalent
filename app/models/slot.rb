class Slot < ActiveRecord::Base
  belongs_to :user
  has_one :video

  scope :available, -> { where(video_id: nil) }
end
