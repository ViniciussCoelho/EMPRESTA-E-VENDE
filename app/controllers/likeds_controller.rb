class LikedsController < ApplicationController
  before_action :set_liked, only: %i[ show edit update destroy ]
  before_action :set_post, only: %i[ show edit update destroy create ]
  before_action :set_community, only: %i[ show edit update destroy create ]

  # GET /likeds or /likeds.json
  def index
    @likeds = Liked.all
  end

  # GET /likeds/1 or /likeds/1.json
  def show
  end

  # GET /likeds/new
  def new
    @liked = Liked.new
  end

  # GET /likeds/1/edit
  def edit
  end

  # POST /likeds or /likeds.json
  def create
    @liked = Liked.create(liked_params)
  end

  # PATCH/PUT /likeds/1 or /likeds/1.json
  # def update
  #   respond_to do |format|
  #     if @liked.update(liked_params)
  #       format.html { redirect_to community_post_likeds_url(@community, @post, @liked), notice: "Liked was successfully updated." }
  #       format.json { render :show, status: :ok, location: @liked }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @liked.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /likeds/1 or /likeds/1.json
  def destroy
    @liked.destroy

    respond_to do |format|
      format.html { redirect_to community_post_likeds_url(@community, @post), notice: "Liked was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_liked
      @liked = Liked.find(params[:id])
    end

    def set_community
      @community = Community.find(params[:community_id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    # Only allow a list of trusted parameters through.
    def liked_params
      params.permit(:post_id).merge(user_id: current_user.id)
    end
end
