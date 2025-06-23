json.array!(@events) do |event|
  json.id event.id
  json.extract! event, :id, :title, :description
  json.detail event.detail
  json.location event.location
  json.start event.start.in_time_zone('Tokyo')
  json.end event.end.in_time_zone('Tokyo')
end