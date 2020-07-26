class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:more, :notifications]
  def more

  end

  def how_it_works
  end

  def notifications
    @pagy, @notifications = pagy(Notification.where(user_id: current_user.id).order(created_at: :DESC), items: 10)
  end
end
