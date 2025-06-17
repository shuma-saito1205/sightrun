class ActivitiesController < ApplicationController


  def new
    @activity = Activity.new
  end

  def create
    activity = Activity.new(activity_params)
    activity.save
    redirect_to 'activity/top'
  end

  def index
    @activities = Activity.all
  end

  private

  def activity_params
    params.require(:activity).permit(:mileage, :hour)
  end

end
