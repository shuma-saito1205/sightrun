class Admin::DashboardsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def index
    @users = User.All
  end
  #管理者画面で登録ユーザー一覧表示

end
