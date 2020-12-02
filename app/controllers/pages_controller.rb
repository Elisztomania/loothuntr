class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @quests_terminees = Quest.where(resolved: true)
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
        image_url: helpers.asset_url('treasure-chest.png')
      }
    end
  end
end
