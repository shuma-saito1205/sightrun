class Admin::EventsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.admin_id = current_admin.id
    if @event.save
      redirect_to admin_path
    else
      render 'homes/top'
    end
  end

  def index
    @events = Event.all
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to admin_events_path
  end

  private

  def event_params
  params.require(:event).permit(:title, :detail, :location, :start, :end)
  end

end
