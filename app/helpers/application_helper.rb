module ApplicationHelper

  # retrieve current user based on fb_user_id and store it in variable @current_user
  def current_user
    # puts "** session[:fb_user_id]=#{session[:fb_user_id]}"
    User.find_by(fb_user_id: session[:fb_user_id]) if session[:fb_user_id]
  end

  def nullify_current_user
    session.delete(:user_id)
    session.delete(:fb_code)
    session.delete(:fb_user_id)
    session.delete(:fb_user_email)
    reset_session
  end

  def set_current_user(user_id)
    session[:user_id] = user_id
  end

  def full_title(page_title)
    title = 'I GOT TALENT'
    title = "#{title} | #{page_title}" if page_title
    return title
  end

  def youtube_video_id
    return '' unless validate_video?
    video = @video || @slot.video || slot.video
    youtube_video_id_of(video)
  end

  def youtube_video_id_of(video)
    regex = /(youtu.be\/|youtube.com\/(watch\?(.*&)?v=|(embed|v)\/))([^\?&\"\'>]+)/
    video.url.match( regex )[5]
  end

  def validate_video?
    return @video || @slot.video
  end
end
