class RepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reply, only: [:show, :edit, :update, :destroy, :report, :favorite]
  before_action :check_if_banned_user, only: [:report, :new, :create]

  #report a post
  def report 
    @reply.report = true
    if @reply.save
      redirect_to request.referrer, notice: "Reply was successfully reported."
    end
  end

  #favorite a reply
  def favorite
    @reply = Reply.find(params[:id])
    @favorite = ReplyFavorite.find_by(reply_id: @reply.id, user_id: current_user.id)

    #create favorite
    if ReplyFavorite.exists?(reply_id: @reply.id, user_id: current_user.id)
      @favorite.destroy
      redirect_to request.referrer, notice: "Reply unfavorited"
    else
      @favorite = ReplyFavorite.new(user_id: current_user.id,
                                reply_id: @reply.id)
      if @favorite.save
        #create notification
        @notification = Notification.new(user_id: @reply.post.user_id,
                                          post_id: @reply.post_id,
                                          notification_type: '0')
        @notification.save
        redirect_to request.referrer, notice: "Post favorited :)"
      else
        redirect_to request.referrer, alert: "Somthing went wrong"
      end
    end 
  end

  # GET /replies
  # GET /replies.json
  def index
    @replies = Reply.all
  end

  # GET /replies/1
  # GET /replies/1.json
  def show
  end

  # GET /replies/new
  def new
    @reply = Reply.new
  end

  # GET /replies/1/edit
  def edit
  end

  # POST /replies
  # POST /replies.json
  def create
    @post = Post.find_by(id: reply_params[:post_id])
    @reply = Reply.new(reply_params)
    @reply.user_id = current_user.id
    @reply.report = false

      if @reply.save
        #create notification
        @notification = Notification.new(user_id: @post.user_id,
                                          post_id: @post.id,
                                          content: reply_params[:content],
                                          notification_type: '1')
        @notification.save
        redirect_to request.referrer, notice: 'Reply was successfully created.'
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply
      @reply = Reply.find(params[:id])
    end
    
    def check_if_banned_user
      if user_signed_in? && Post.where(user_id: current_user.id, report: true, checked: true).count >= 3
        redirect_to request.referrer, alert: "You have been banned from posting on the application. Too many of your posts were reported and taken down. Please contact support for more details."
      end
    end

    # Only allow a list of trusted parameters through.
    def reply_params
      params.require(:reply).permit(:post_id, :user_id, :report, :content)
    end
end
