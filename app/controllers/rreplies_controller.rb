class RrepliesController < ApplicationController
  before_action :set_rreply, only: [:show, :edit, :update, :destroy]

  # GET /rreplies
  # GET /rreplies.json
  def index
    @rreplies = Rreply.all
  end

  # GET /rreplies/1
  # GET /rreplies/1.json
  def show
  end

  # GET /rreplies/new
  def new
    @rreply = Rreply.new
  end

  # GET /rreplies/1/edit
  def edit
  end

  # POST /rreplies
  # POST /rreplies.json
  def create
    @rreply = Rreply.new(rreply_params)

    respond_to do |format|
      if @rreply.save
        format.html { redirect_to @rreply, notice: 'Rreply was successfully created.' }
        format.json { render :show, status: :created, location: @rreply }
      else
        format.html { render :new }
        format.json { render json: @rreply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rreplies/1
  # PATCH/PUT /rreplies/1.json
  def update
    respond_to do |format|
      if @rreply.update(rreply_params)
        format.html { redirect_to @rreply, notice: 'Rreply was successfully updated.' }
        format.json { render :show, status: :ok, location: @rreply }
      else
        format.html { render :edit }
        format.json { render json: @rreply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rreplies/1
  # DELETE /rreplies/1.json
  def destroy
    @rreply.destroy
    respond_to do |format|
      format.html { redirect_to rreplies_url, notice: 'Rreply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rreply
      @rreply = Rreply.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rreply_params
      params.require(:rreply).permit(:reply_id, :content)
    end
end
