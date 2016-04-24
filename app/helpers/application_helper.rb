module ApplicationHelper

  def current_user
    user_id = session[:user_id] || 1
    User.find(user_id)
  end

  def full_title(page_title)
    title = 'I GOT TALENT'
    title = "#{title} | #{page_title}" if page_title
    return title
  end

  def youtube_video_id
    return '' unless validate_video?
    video = @video || @slot.video
    regex = /(youtu.be\/|youtube.com\/(watch\?(.*&)?v=|(embed|v)\/))([^\?&\"\'>]+)/
    video.url.match( regex )[5]
  end

  def validate_video?
    return @video || @slot.video
  end
end
