class QuestsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index

  end

  def new

  end

  def show

  end

  def create

  end

  def edit

  end

  def update

  end

  private

  def set_quest
  end

  def quest_params

  end
end
