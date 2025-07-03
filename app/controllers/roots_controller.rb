class RootsController < ApplicationController

  def new
    @root = Root.new
  end

  def create
    @root = Root.new(latitude: params[:lat], longitude: params[:lng])
    @root.favorite_course_id = FavoriteCourse.find(params[:favorite_course_id])
    if @root.save
      render json: @root, status: :created
    else
      render json: @root.errors, status: :unprocessable_entity
    end
  end
  
private

  def root_params
    params.require(:root).permit(:address, :latitude, :longitude)
  end

end
