class GroupsController < ApplicationController
  before_action authenticate_user!
  before_action :ensure_current_user, only: [:edit, :update]

  def index
    @group = Groups.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    group = Group.new
    group.owner_id = current_user.id
    group.save
    redirect_to groups_path
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
  
end
