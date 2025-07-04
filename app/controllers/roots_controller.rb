class RootsController < ApplicationController
  before_action :set_favorite_course, only: [:new, :create]

  def new
    @root = @favorite_course.roots.build
  end

  def create
    @root = @favorite_course.roots.build(root_params)

    if @root.save
      redirect_to @root, notice: 'Rootを作成しました'
    else
      render :new
    end
  end

  private
    def set_favorite_course
      @favorite_course = FavoriteCourse.find_by(id: params[:favorite_course_id])
      if @favorite_course.nil?
        @favorite_course = FavoriteCourse.new
      end
    end

    def root_params
      params.require(:root).permit(:latitude, :longitude)
    end
end




