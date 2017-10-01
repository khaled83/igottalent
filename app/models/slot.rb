class Slot < ActiveRecord::Base
  belongs_to :user
  has_one :video

  scope :popular, -> { joins(:video).where('liked').order('likes_count DESC') }
  scope :available, -> { where(video_id: nil) }
  scope :latest, -> { order('created_at DESC') }
end
