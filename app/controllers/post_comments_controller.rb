class PostCommentsController < ApplicationController
  def index
  end

  def create
    post = Post.find(params[:post_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_id = post.id
    if comment.save
      redirect_to post_path(post)
    else
      @error_comment = comment
      @post = Post.find(params[:post_id])
      @user = User.find(@post.user_id)
      @post_comment = PostComment.new
      render template: "posts/show"
    end
  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_path(params[:post_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
  
end
