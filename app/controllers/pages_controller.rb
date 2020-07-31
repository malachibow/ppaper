class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:more, :notifications]
  
  def my_favorites
    if !params[:search].blank? && params.has_key?(:search)
      @pagy, @posts = pagy(Post.where('title ILIKE :search OR body ILIKE :search OR tags ILIKE :search', search: "%#{params[:search]}%").where(id: Favorite.select("post_id").where(user_id: current_user.id)))
    else
      @pagy, @posts = pagy(Post.where(id: Favorite.select("post_id").where(user_id: current_user.id)))
    end
  end

  def like_persuasion_paper
  end

  def my_posts
    if !params[:search].blank? && params.has_key?(:search)
      @pagy, @posts = pagy(Post.where('title ILIKE :search OR body ILIKE :search OR tags ILIKE :search', search: "%#{params[:search]}%").where(user_id: current_user.id))
    else
      @pagy, @posts = pagy(Post.where(user_id: current_user.id))
    end
  end

  def reported
    if current_user.admin?
      @pagy, @reported = pagy(Post.where(report: true, checked: false))
    else
      redirect_to root_path, alert: "You do not have permission"
    end
  end

  def keep
    @post = Post.find(params[:id])
    @post.checked = true
    @post.report = false
    if @post.save
      redirect_to request.referrer, notice: "Post kept"
    end
  end

  def remove
    @post = Post.find(params[:id])
    @post.checked = true
    if @post.save
      redirect_to request.referrer, notice: "Post removed"
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
