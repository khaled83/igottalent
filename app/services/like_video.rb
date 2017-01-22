class LikeVideo

  def self.like(video_id, user_id)
    # skip if this video already liked before
    unless Like.liked?(video_id, user_id)
      dislike = Like.find_by( video: video_id, user: user_id, liked: false )
      dislike.delete if dislike
      # new like
      Like.create( video: video_id, user: user_id, liked: true )
    end
  end

  def self.dislike(video_id, user_id)
    # skip if this video already liked before
    unless Like.disliked?(video_id, user_id)
      like = Like.find_by( video: video_id, user: user_id, liked: true )
      like.delete if like
      # new dislike
      Like.create( video: video_id, user: user_id, liked: false )
    end
  end

end