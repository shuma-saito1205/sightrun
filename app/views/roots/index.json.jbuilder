json.array!(@roots) do |root|
  json.id root.id
  json.user_id user_id
  json.latitude: root.latitude
  json.longitude: root.longitude
end