class RootsController < ApplicationController

  def create
    @root = Root.new(latitude: params[:lat], longitude: params[:lng])
    if @root.save
      render json: @root, status: :created
    else
      render json: @root.errors, status: :unprocessable_entity
    end
  end
  

end
