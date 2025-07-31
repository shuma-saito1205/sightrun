class RootsController < ApplicationController
  before_action :set_root, only: [:new, :create]

  def new
    @root = Root.new
  end

  def create
    latitude = params[:latitude]
    longitude = params[:longitude]
    user_id = params[:user_id]
    @root = Root.new(latitude: latitude, longitude: longitude, user_id: user_id)
    if @root.save
      render json: { message: 'ピンを保存しました！' }
    else
      render json: { error: 'ピンの保存に失敗しました。' }
    end
  end

  def show
    @root = Root.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def index
    @user = User.find(params[:user_id])
    @roots = @user.roots
  end

  def destroy
    root = Root.find(params[:id])
    @user = User.find(params[:user_id])
    root.destroy
    redirect_to user_roots_path(current_user)
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




