class Slot < ActiveRecord::Base
  belongs_to :user
  has_one :video

  scope :popular, -> { joins(:video).order('likes_count DESC') }
  scope :available, -> { where(video_id: nil) }
  scope :latest, -> { order('created_at DESC') }
  scope :recommended, -> { order('RANDOM()').limit(3) }
end
