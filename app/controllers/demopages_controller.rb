class DemopagesController < ApplicationController
  def home
    if user_signed_in?
      redirect_to posts_path
    end
  end

  def sign_up
  end

  def country_search
  end

  def country_page
  end

  def admin_dash
  end

  def country_index
  end

  def country_page_editor
  end
end
