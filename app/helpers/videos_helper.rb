module VideosHelper

  def live?(slot)
    slot.start_time <= Time.now
  end

end
