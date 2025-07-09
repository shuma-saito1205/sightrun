class RootsController < ApplicationController
  before_action :set_root, only: [:new, :create]

  def new
    @root = Root.new
  end

  def create
    @root = Root.new(root_params)
    @root.user_id = current_user.id
    if @root.save
      redirect_to user_roots_path(current_user)
    else
      render json: { error: 'Failed to save marker data' }, status: :unprocessable_entity
    end
  end

  def show
    @root = Root.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def index
    @user = User.find(params[:user_id])
    @roots = @user.roots
    @root = @roots.last
  end
  
private

  def set_root
    @root = Root.find_by(id: params[:root_id])
    if @root.nil?
      @root = Root.new
    end
  end

  def root_params
    params.require(:root).permit(:user_id, :latitude, :longitude)
  end

end




