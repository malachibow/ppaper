class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :new, :create, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy, :report]

    #report a post
  def report 
    @post.report = true
    if @post.save
        #create notification
        @notification = Notification.new(user_id: @post.user_id,
                                          post_id: @post.id,
                                          notification_type: '2')
        @notification.save
      redirect_to request.referrer, notice: "Reply was successfully reported."
    end
  end

  #randomize or order posts algorithm
  def order_posts
    @posts = Post.all.order('RANDOM()')
  end

  # GET /posts
  # GET /posts.json
  def index
    if params.has_key?(:search) && !params[:search].blank?
      @pagy, @posts = pagy(Post.where(report: false).where('title ILIKE :search OR body ILIKE :search OR tags ILIKE :search', search: "%#{params[:search]}%"), items: 3)
    else
      @pagy, @posts = pagy(Post.where(report: false), items: 3)
    end
  end

  #favorite a post
  def favorite
    @post = Post.find(params[:id])
    @favorite = Favorite.find_by(post_id: @post.id, user_id: current_user.id)

    #create favorite
    if Favorite.exists?(post_id: @post.id, user_id: current_user.id)
      @favorite.destroy
      redirect_to request.referrer, notice: "Post unfavorited"
    else
      @favorite = Favorite.new(user_id: current_user.id,
                                post_id: @post.id)
      if @favorite.save
        #create notification
        @notification = Notification.new(user_id: @post.user_id,
                                          post_id: @post.id,
                                          notification_type: '0')
        @notification.save
        redirect_to request.referrer, notice: "Post favorited :)"
      else
        redirect_to request.referrer, alert: "Somthing went wrong"
      end
    end 
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @replies = Reply.where(post_id: @post.id)
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
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
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body, :anonymous, :publish, :tags)
    end
end

