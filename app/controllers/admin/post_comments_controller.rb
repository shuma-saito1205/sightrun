class Admin::PostCommentsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def index
    @post_comments = PostComment.all
    @users = User.all
  end

end
