class Admin::EventsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.admin_id = current_admin.id
    @event.save
    respond_to do |format|
      format.html
      format.json { render 'calendar' }
    end
  end

  def index
    @events = Event.all
    respond_to do |format|
      format.html
      format.json { render 'calendar' }
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])
    event.update
    redirect_to admin_event_path(event.id)
  end

  private

  def event_params
  params.require(:event).permit(:title, :detail, :location, :start_date, :end_date)
  end

end
