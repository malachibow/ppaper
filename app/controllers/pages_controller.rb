class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:more, :notifications]
  
  def my_favorites
    if !params[:search].blank? && params.has_key?(:search)
      @posts = Post.where('title ILIKE :search OR body ILIKE :search OR tags ILIKE :search', search: "%#{params[:search]}%").where(id: Favorite.select("post_id").where(user_id: current_user.id))
    else
      @posts = Post.where(id: Favorite.select("post_id").where(user_id: current_user.id))
    end
  end

  def my_posts
    if !params[:search].blank? && params.has_key?(:search)
      @posts = Post.where('title ILIKE :search OR body ILIKE :search OR tags ILIKE :search', search: "%#{params[:search]}%").where(user_id: current_user.id)
    else
      @posts = Post.where(user_id: current_user.id)
    end
  end

  def more
  end

  def how_it_works
  end

  def notifications
    @pagy, @notifications = pagy(Notification.where(user_id: current_user.id).order(created_at: :DESC), items: 10)
  end
end
