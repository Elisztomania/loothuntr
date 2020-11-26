class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update]
  before_action :set_guild, only: [:pistes, :new, :create]

  def pistes
    @pistes = Post.where(category: "piste")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.guild_id = params[:guild_id]
    if @post.save && @post.category == "piste"
      redirect_to pistes_guild_posts_path(@guild)
    elsif @post.save && @post.category == "orga"
      redirect_to guild_path(@guild)
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

  def set_guild
    @guild = Guild.find(params[:guild_id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :user_id, :guild_id, :category)
  end
end
