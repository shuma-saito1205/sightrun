class ActivitiesController < ApplicationController


  def new
    @activity = Activity.new
  end

  def create
    mileage = params[:mileage]
    hour = params[:hour]
    hours, minutes, seconds = hour.split(':').map(&:to_i)
    total_seconds = hours * 3600 + minutes * 60 + seconds
    @activity = Activity.new(hour: total_seconds, mileage: mileage)
    @activity.user_id = current_user.id
    if @activity.save
      redirect_to activities_path
    else
      @activities = Activity.all
      @total_mileage = @activities.sum(:mileage)
      @total_hour = @activities.sum(:hour).to_i

      total_hours = @total_hour / 3600
      total_minutes = (@total_hour % 3600) / 60
      total_seconds = @total_hour % 60
      @total_time = "#{total_hours}:#{total_minutes}:#{total_seconds}"
      render 'index'
    end
  end

  def index
    @activities = Activity.all
    @total_mileage = @activities.sum(:mileage)
    @total_hour = @activities.sum(:hour).to_i
    total_hours = '%02d' % (@total_hour / 3600)
    total_minutes = '%02d' % ((@total_hour % 3600) / 60)
    total_seconds = '%02d' % (@total_hour % 60)
    @total_time = "#{total_hours}:#{total_minutes}:#{total_seconds}"
  end

  def destroy
    activity = Activity.find(params[:id])
    activity.destroy
    redirect_to activities_path
  end
  
  private

  def activity_params
    params.require(:activity).permit(:mileage, :hour)
  end

end
