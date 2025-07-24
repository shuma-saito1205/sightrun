class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :permits]

  def index
    @groups = Group.all
    if params[:id].present?
      set_group
    else
      @group = Group.new
    end
  end

  def show
    @group = Group.find(params[:id])
    
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      redirect_to groups_path
    else
      render 'new'
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    if group.update(group_params)
      redirect_to group_path
    else
      render 'edit'
    end
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    redirect_to groups_path
  end
  
  def permits
    @group = Group.find(params[:id])
    @permits = @group.permits.all
  end

  private

  def group_params
    params.require(:group).permit(:name, :theme)
  end

  def ensure_correct_user
    @group = Group.find(params[:id])
    unless @group.owner_id == current_user.id
      redirect_to group_path(@group), alert: "Only the group owner can edit it."
    end
  end


end
