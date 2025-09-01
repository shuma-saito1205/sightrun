class ActivitiesController < ApplicationController


  def new
    @activity = Activity.new
  end

  def create
    mileage = params[:mileage]
    hour = params[:hour]
    total_seconds = nil
    if hour.present?
      hours, minutes, seconds = hour.split(':').map(&:to_i)
      total_seconds = hours * 3600 + minutes * 60 + seconds
    end
    @activity = Activity.new(hour: total_seconds, mileage: mileage)
    @activity.user_id = current_user.id
    if @activity.save
      flash[:notice] = "Create activity!"
      redirect_to user_activities_path
    else
      @activities = Activity.all
      @activity.user_id = current_user.id
      @total_mileage = @activities.sum(:mileage)
      @total_hour = @activities.sum(:hour).to_i
      total_hours = @total_hour / 3600
      total_minutes = (@total_hour % 3600) / 60
      total_seconds = @total_hour % 60
      @total_time = "#{total_hours}:#{total_minutes}:#{total_seconds}"
      flash.now[:notice] = "Uncreate activity"
      render :index
    end
  end

  def index
    @activities = current_user.activities
    @total_mileage = @activities.sum(:mileage)
    @total_hour = @activities.sum(:hour).to_i
    total_hours = '%02d' % (@total_hour / 3600)
    total_minutes = '%02d' % ((@total_hour % 3600) / 60)
    total_seconds = '%02d' % (@total_hour % 60)
    @total_time = "#{total_hours}:#{total_minutes}:#{total_seconds}"
    if params[:id].present?
      set_activity
    else
      @activity = Activity.new
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to user_activities_path
  end
  
  private

  def activity_params
    params.require(:activity).permit(:mileage, :hour)
  end

end
