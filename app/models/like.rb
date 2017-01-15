class Like < ActiveRecord::Base

  def self.liked?( video_id, user_id )
    like = Like.find_by( video: video_id, user: user_id)
    like and like.liked?
  end

  def self.disliked?( video_id, user_id )
    like = Like.find_by( video: video_id, user: user_id)
    like and not like.liked?
  end

  def self.like_count( video_id )
    Like.where( video: video_id, liked: true ).count + 1000
  end

  def self.dislike_count( video_id )
    Like.where( video: video_id, liked: false ).count + 900
  end

end
