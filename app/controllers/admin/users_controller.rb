class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_dashboards_path, notice: 'Delete user'
  end
  
end
