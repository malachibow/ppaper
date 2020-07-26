class PagesController < ApplicationController
  before_action :authenticate_user!
  def more

  end

  def notifications
    @notifications = Notification.where(user_id: current_user.id).order(created_at: :DESC)
  end
end
