class CommentsController < ApplicationController
  before_action :set_post, only: [:create]

  def create
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user
    if @comment.save && @post.category == "orga" || @post.category == "piste"
    else
      # render :new
      redirect_to guild_path(@post.guild)
    end
    # if @comment.save && @post.category == "piste"
    #   redirect_to pistes_guild_posts_path(@post.guild)
    # elsif @comment.save && @post.category == "orga"
    #   redirect_to guild_path(@post.guild)
    # else
    #   render :new
    # end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end
