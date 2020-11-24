class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @quests = Quest.all
    @guild = Guild.first
    @member = Member.first
    @user = current_user
  end
end
