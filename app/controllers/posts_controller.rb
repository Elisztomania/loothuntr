class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.guild_id = params[:guil_id]
    if @post.save!
      redirect_to quest_path
    else
      render :new
    end

  end

  def edit

  end

  def update

  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :user_id, :guild_id)
  end
end
