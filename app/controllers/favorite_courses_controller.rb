class FavoriteCoursesController < ApplicationController

  def new
    @favorite_course = FavoriteCourse.new
  end

  def create
    @favorite_course = FavoriteCourse.new(favorite_course_params)
    @favorite_course.user_id = current_user.id
    if @favorite_course.save
      redirect_to user_favorite_course_path
    else 
      render 'new'
    end
  end

  def show
    @favorite_course = FavoriteCourse.find_by(id: params[:id])
    if @favorite_course.nil?
      redirect_to new_user_favorite_course_root_path
    end
  end

  def index
    @favorite_courses = FavoriteCourse.all
  end

  def edit
    @favorite_course = FavoriteCourse.find(params[:id])
  end

  def update
    @favorite_course = FavoriteCourse.find(params[:id])
    if @favorite_course.update(favorite_course_params)
      redirect_to favorite_courses_path
    else
      render 'edit'
    end
  end

  private

  def favorite_course_params
    params.require(:favorite_course).permit(:introduction)
  end

end
