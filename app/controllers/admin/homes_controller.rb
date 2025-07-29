class Admin::HomesController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def top
    @users = User.all
    @post_comments = PostComment.all
    @events = Event.all
    if params[:id].present?
      set_group
    else
      @event = Event.new
    end
  end
end
