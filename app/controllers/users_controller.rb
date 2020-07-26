class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:read_notifications]

  def read_notification
    current_user.read_notification = DateTime.current
    current_user.save
    redirect_to pages_notifications_path
  end

  def profile
  end
end
