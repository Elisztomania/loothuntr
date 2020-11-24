class MembersController < ApplicationController
  before_action :set_guild, only: [:new, :create, :accepted]
  before_action :set_member, only: [:accepted, :refused]

  def new
    @guild = Guild.find(params[:guild_id])
    @user = current_user
    @member = Member.new
  end

  def create
    @user = current_user
    @member = Member.new(member_params)
    @member.guild = @guild
    @member.user = @user
    if @member.save
      redirect_to quest_path(@member.guild.quest)
    else
      render :new
    end
  end

  def accepted
    @member.accepted = true
    @guild.member = @member.user
    @member.save
    @guild.save
    redirect_to quest_guild_path(@guild)
  end

  def refused
    @member.accepted = false
    @member.save
    redirect_to quest_guild_path(@guild)
  end

  private

  def set_member
    @member = Member.find(params[:member_id])
  end

  def set_guild
    @guild = Guild.find(params[:guild_id])
  end

  def member_params
    params.require(:member).permit(:cover_letter)
  end
end
