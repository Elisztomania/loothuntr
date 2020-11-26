class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @quests = Quest.all
    @guild = Guild.first
    @member = Member.first
    @user = current_user
  end

  def index
    @quests = Quest.all

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @quests.geocoded.map do  quest|
      {
        lat: quest.latitude,
        lng: quest.longitude
      }
    end
  end
end
