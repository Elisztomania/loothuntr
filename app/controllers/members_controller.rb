class MembersController < ApplicationController
  before_action :set_guild, only: [:new, :create]
  before_action :set_member, only: [:accepted, :refused]

  def new
    @guild = Guild.find(params[:guild_id])
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    @member.user = current_user
    @member.guild = @guild
    if @member.save
      redirect_to quest_path(@guild.quest), notice: 'Votre candidature est bien envoyée ✌️'
    else
      render :new
    end
  end

  def accepted
    @member.accepted = true
    @member.save
    @member.guild.save
    redirect_to guild_path(@member.guild), notice: 'Vous avez bien accepté la candidature 🥰'
  end

  def refused
    @member.delete
    @member.save
    @member.guild.save
    redirect_to guild_path(@member.guild), notice: 'Vous avez bien refusé la candidature 😭'
  end

  private

  def set_member
    @member = Member.find(params[:id])
  end

  def set_guild
    @guild = Guild.find(params[:guild_id])
  end

  def member_params
    params.require(:member).permit(:cover_letter)
  end
end
