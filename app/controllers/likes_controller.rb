class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(author: current_user)

    flash[:error] = 'There was an error liking the post' unless @like.save
    redirect_to user_post_path(current_user, @post)
  end

  def destroy
    @like = Like.find(params[:id])
    @post = @like.post

    @like.destroy
    redirect_to user_post_path(@post.author, @post)
  end
end
