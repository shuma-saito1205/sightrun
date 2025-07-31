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
    flash[:notice] = "Delete user"
    redirect_to admin_path
  end

end
