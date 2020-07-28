class RepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reply, only: [:show, :edit, :update, :destroy, :report]

  #report a post
  def report 
    @reply.report = true
    if @reply.save
      redirect_to request.referrer, notice: "Reply was successfully reported."
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

    # Only allow a list of trusted parameters through.
    def reply_params
      params.require(:reply).permit(:post_id, :user_id, :report, :content)
    end
end
