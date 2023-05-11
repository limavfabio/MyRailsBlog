class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.all
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @current_user = User.first
    @post = Post.new
  end

  def create
    @current_user = User.first
    @post = Post.new(
      title: params[:post][:text],
      text: params[:post][:text],
      author: @current_user
    )

    if @post.save
      redirect_to user_post_path(@current_user, @post)
    else
      flash[:error] = 'Post could not be saved'
      render :new, status: :unprocessable_entity
    end
  end

  def create_comment
    @current_user = User.first

    post = Post.find(params[:id])
    comment = Comment.new(
      text: params[:comment][:text],
      author: @current_user,
      post:
    )

    if comment.save
      redirect_to user_post_path(post.author, post)
    else
      flash[:error] = 'Comment could not be saved'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
