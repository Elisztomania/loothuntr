class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @quests = Quest.all
    @guild = Guild.first
    @member = Member.first
    @user = current_user

    # @quests = policy_scope(Quest).order(created_at: :desc)

    @markers = @quests.geocoded.map do |quest|
      {
        lat: quest.latitude,
        lng: quest.longitude,
        infoWindow: render_to_string(partial: "shared_bastien/info_window", locals: { quest: quest }),
      }
    end
  end
end
