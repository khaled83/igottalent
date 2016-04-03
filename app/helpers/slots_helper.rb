module SlotsHelper
  def default_slot_start_time
    return Time.now.beginning_of_hour
  end

  def default_slot_end_time
    return default_slot_start_time + (5 * 60)
  end

  def video_url(slot)
    url = ''
    url = slot.video.url if slot and slot.video
    return url
  end
end
