json.array!(@slots) do |slot|
  json.extract! slot, :id
  json.url slot_url(slot, format: :json)
end
