class FavoriteCoursesController < ApplicationController

  def new
    @favorite_course = FavoriteCourse.new
  end

  def create
    @favorite_course = FavoriteCourse.new(favorite_course_params)
    @favorite_course.user_id = current_user.id
    if @favorite_course.save
      redirect_to favorite_courses_path
    else 
      render 'new'
    end
  end

  def index
    @favorite_courses = FavoriteCourse.all
  end

  def edit
    @favorite_course = FavoriteCourse.find(params[:id])
  end

  private

  def favorite_course_params
    params.require(:favorite_course).permit(:introduction)
  end

end
