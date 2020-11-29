class GuildsController < ApplicationController
  before_action :set_guild, only: [:show, :edit, :update, :resolved]

  def show_my_guilds
    @guilds = Guild.all
  end

  def show
    # show dashboard with the chat, the calendar, th members of the teams
    @members = User.where(:acccepted == true)
    @post_new = Post.new
    @comment_new = Comment.new
  end

  def new
    @quest = Quest.find(params[:quest_id])
    @guild = Guild.new
  end

  def create
    @guild = Guild.new(guild_params)
    @guild.creator = current_user
    @guild.quest_id = params[:quest_id]
    if @guild.save
      redirect_to guild_path(@guild)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @guild.update(guild_params)
      redirect_to guild_path(@guild), notice: 'Votre quête est bien modifiée ✌️'
    else
      render :edit
    end
  end

  def resolved
    @guild.quest.resolved = true
    @post_new = Post.new
    @guild.quest.save
  end

  private

  def set_guild
    @guild = Guild.find(params[:id])
  end

  def guild_params
    params.require(:guild).permit(:quest_id, :creator, :name, :description)
  end

  def post_params
    params.require(:post).permit(:title, :description, :user_id, :guild_id, :category)
  end
end
