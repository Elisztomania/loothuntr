class PostsController < ApplicationController
  before_action :set_post, only: [:new_avancee_from_post, :update, :create_avancee_from_post]
  before_action :set_guild, only: [:pistes, :new, :create]

  def pistes
    @pistes = Post.where(category: ["piste", "piste_publiee"])
    @comment_new = Comment.new
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
    elsif @post.save && @post.category == "avancee"
      redirect_to quest_path(@guild.quest)
    else
      render :new
    end
  end

  def new_avancee_from_post
    @avancee = @post.dup
  end

  def create_avancee_from_post
    @avancee = Post.new(post_params)
    @avancee.category = "avancee"
    @avancee.user = @post.user
    # recuperer les photos
    @post.photos.each do |photo|
      @avancee.photos.attach(
        :io           => StringIO.new(photo.download),
        :filename     => photo.filename,
        :content_type => photo.content_type
      )
    end
    # recuperer les photos fin
    @avancee.guild = @post.guild
    if @avancee.save
      @post.category = "piste_publiee"
      @post.save
      redirect_to quest_path(@avancee.guild.quest), notice: "Votre piste est bien une avancée ✌️"
    else
      @avancee = @post.dup
      render :new_avancee_from_post
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_guild
    @guild = Guild.find(params[:guild_id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :user_id, :guild_id, :category, photos: [])
  end
end
