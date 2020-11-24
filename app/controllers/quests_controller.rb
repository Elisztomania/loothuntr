class QuestsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_quest, only: [:show, :edit, :update]

  def index
    @quests = Quest.all
  end

  def new
    @quest = Quest.new
  end

  def show
    # @guild = Guild.find(guild_id == @quest_id)
    # @guild.quest_id = params[:quest_id]
  end

  def create
    @quest = Quest.new(quest_params)
    @quest.creator = current_user
    if @quest.save!
      redirect_to @quest
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @quest.update(quest_params)
      redirect_to @quest, notice: 'Votre quête est bien modifié 🤠'
    else
      render :edit
    end
  end

  private

  def set_quest
    @quest = Quest.find(params[:id])
  end

  def quest_params
    params.require(:quest).permit(:title, :description, :location, :resolved, :creator_id)
  end
end
