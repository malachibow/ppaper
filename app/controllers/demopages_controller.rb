class DemopagesController < ApplicationController
  def home
    @posts = Post.not_reported
    if user_signed_in?
      redirect_to new_post_path
    end
  end
end
