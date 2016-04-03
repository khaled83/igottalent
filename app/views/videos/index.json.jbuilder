json.array!(@videos) do |video|
  json.extract! video, :id, :title, :type, :genre, :url, :duration_in_seconds, :user_id
  json.url video_url(video, format: :json)
end
