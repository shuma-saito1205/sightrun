class PermitsController < ApplicationController
  before_action :authenticate_user!

  def create
    @group = Group.find(params[:group_id])
    permit = current_user.permits.new(group_id: params[:group_id])
    if permit.save
      flash[:notice] = "Applied to participate!"
      redirect_to group_path(@group.id)
    else
      render :new
    end
  end

  def destroy
    permit = current_user.permits.find_by(group_id: params[:group_id])
    permit.destroy
    redirect_to request.referer, alert: "グループへの参加申請を取消しました"
  end

end
