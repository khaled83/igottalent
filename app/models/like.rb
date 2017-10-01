class Like < ActiveRecord::Base

  belongs_to :video, counter_cache: true

  def self.liked?( video_id, user_id )
    like = Like.find_by( video_id: video_id, user: user_id)
    like and like.liked?
  end

  def self.disliked?( video_id, user_id )
    like = Like.find_by( video_id: video_id, user: user_id)
    like and not like.liked?
  end

  def self.like_count( video_id )
    Like.where( video_id: video_id, liked: true ).count + 1000
  end

  def self.dislike_count( video_id )
    Like.where( video_id: video_id, liked: false ).count + 1000
  end

end
