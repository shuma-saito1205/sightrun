class Root < ApplicationRecord
  belongs_to :user

  geocoded_by :address
  after_validation :geocode

  def display_markers_for_favorite_course(favorite_course_id)
    roots = Root.where(favorite_course_id: favorite_course_id).select(:latitude, :longitude)
    markers = roots.map { |root| { lat: root.latitude, lng: root.longitude } }
    return markers
  end
  
end
