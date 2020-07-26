class PagesController < ApplicationController
  before_action :authenticate_user!
  def more

  end

  def notifications
    @pagy, @notifications = pagy(Notification.where(user_id: current_user.id).order(created_at: :DESC), items: 10)
  end
end
