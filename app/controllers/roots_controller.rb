class RootsController < ApplicationController

  def save_marker
    latitude = params[:latitude]
    longitude = params[:longitude]
    Root.create(favorite_course_id: params[:favorite_course_id], latitude: latitude, longitude: longitude)
  end

end
