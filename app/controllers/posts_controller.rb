class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :new, :create, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy, :report]
  before_action :check_if_banned_user, only: [:report, :new, :create]

    #report a post
  def report 
    if !@post.report?
      @post.report = true
      if @post.save
          #create notification
          @notification = Notification.new(user_id: @post.user_id,
                                            post_id: @post.id,
                                            notification_type: '2')
          @notification.save
        redirect_to post_path(@post.id), notice: "Post was successfully reported."
      end
    else
      redirect_to post_path(@post.id), notice: "Post was already reported."
    end
  end

  # GET /posts
  # GET /posts.json
  def index
    if user_signed_in? && !params[:search].blank? && params.has_key?(:search)
      @post = Post.where('title ILIKE :search OR body ILIKE :search OR tags ILIKE :search', search: "%#{params[:search]}%").where.not(id: View.select("post_id").where(user_id: current_user.id), report: true).order("RANDOM()")
    if @post.blank?
      @post = Post.where('title ILIKE :search OR body ILIKE :search OR tags ILIKE :search', search: "%#{params[:search]}%").where(report: false).order("RANDOM()").first
    end
    else
      randomize
      @post = @initial_post
    end
  end

  #favorite a post
  def favorite
    @post = Post.find(params[:id])
    @favorite = Favorite.find_by(post_id: @post.id, user_id: current_user.id)

    #create favorite
    if Favorite.exists?(post_id: @post.id, user_id: current_user.id)
      @favorite.destroy
      redirect_to post_path(@post.id), notice: "Post unfavorited"
    else
      @favorite = Favorite.new(user_id: current_user.id,
                                post_id: @post.id)
      if @favorite.save
        #create notification
        @notification = Notification.new(user_id: @post.user_id,
                                          post_id: @post.id,
                                          notification_type: '0')
        @notification.save
        redirect_to post_path(@post.id), notice: "Post favorited :)"
      else
        redirect_to post_path(@post.id), alert: "Somthing went wrong"
      end
    end 
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @pagy, @replies = pagy(Reply.where(post_id: @post.id, report: false), items: 5)
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.report = "false"

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def randomize
        if user_signed_in?
        @initial_post = Post.where.not(id: View.select("post_id").where(user_id: current_user.id), report: true).order("RANDOM()").first
        end
        if !@initial_post.blank?
          @view = View.new(user_id: current_user.id,
          post_id: @initial_post.id)
          @view.save
          else
          @initial_post = Post.order("RANDOM()").first
        end
    end

    def check_if_banned_user
      if user_signed_in? && Post.where(user_id: current_user.id, report: true, checked: true).count >= 3
        redirect_to root_path, alert: "You have been banned from posting on the application. Too many of your posts were reported and taken down. Please contact support for more details."
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body, :anonymous, :publish, :tags)
    end
end

