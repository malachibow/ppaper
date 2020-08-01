class RepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reply, only: [:show, :edit, :update, :destroy, :report, :favorite]

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
  # POST /replies
  # POST /replies.json
  def create
    @post = Post.find_by(id: reply_params[:post_id])
    if Reply.exists?(user_id: current_user.id, post_id: @post.id)
      redirect_to request.referrer, notice: 'You have already created a reply for this post'
      return
    end
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

  def update
    if @reply.user_id != current_user.id
      redirect_to root_path, notice: 'You are not the creator of this reply.'
      return
    end
    if @reply.update(reply_params)
      redirect_to request.referrer, notice: 'Reply was successfully updated.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply
      @reply = Reply.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reply_params
      params.require(:reply).permit(:post_id, :user_id, :content)
    end
end
