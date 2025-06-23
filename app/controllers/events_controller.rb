class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
  params.require(:event).permit(:title, :detail, :location, :start, :end)
  end
end
