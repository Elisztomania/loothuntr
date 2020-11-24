class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @quest = Quest.first
    @guild = Guild.first
    @member = Member.first
    @user = current_user
  end
end
