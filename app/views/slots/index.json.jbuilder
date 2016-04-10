json.array!(@slots) do |slot|
  json.extract! slot, :id, :start_time, :end_time, :type, :genre, :user_id, :video_id
  json.url slot_url(slot, format: :json)
end
