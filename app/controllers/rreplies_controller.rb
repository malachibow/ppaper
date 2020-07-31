class RrepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_rreply, only: [:show, :edit, :update, :destroy, :report, :favorite]

  #report a post
  def report 
    @rreply.report = true
    if @rreply.save
      redirect_to request.referrer, notice: "Reply was successfully reported."
    end
  end

  #favorite a reply
  def favorite
    @rreply = Rreply.find(params[:id])
    @favorite = RreplyFavorite.find_by(rreply_id: @rreply.id, user_id: current_user.id)

    #create favorite
    if RreplyFavorite.exists?(rreply_id: @rreply.id, user_id: current_user.id)
      @favorite.destroy
      redirect_to request.referrer, notice: "Reply unfavorited"
    else
      @favorite = RreplyFavorite.new(user_id: current_user.id,
                                rreply_id: @rreply.id)
      if @favorite.save
        #create notification
        @notification = Notification.new(user_id: @rreply.reply.post.user_id,
                                          post_id: @rreply.reply.post_id,
                                          notification_type: '0')
        @notification.save
        redirect_to request.referrer, notice: "Post favorited :)"
      else
        redirect_to request.referrer, alert: "Somthing went wrong"
      end
    end 
  end

  # POST /rreplies
  # POST /rreplies.json
  def create
    @rreply = Rreply.new(rreply_params)

    respond_to do |format|
      if @rreply.save
        format.html { redirect_to request.referrer, notice: 'Reply was successfully created.' }
        format.json { render :show, status: :created, location: @rreply }
      else
        format.html { redirect_to request.referrer, alert: 'Reply was successfully created.'}
        format.json { render json: @rreply.errors, status: :unprocessable_entity }
      end
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rreply
      @rreply = Rreply.find(params[:id])
    end

    def check_if_banned_user
      if user_signed_in? && Post.where(user_id: current_user.id, report: true, checked: true).count >= 3
        return
      end
    end

    # Only allow a list of trusted parameters through.
    def rreply_params
      params.require(:rreply).permit(:reply_id, :content)
    end
end
