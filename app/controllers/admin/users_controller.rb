class Admin::UsersController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_dashboards_path, notice: 'Delete user'
  end

end
