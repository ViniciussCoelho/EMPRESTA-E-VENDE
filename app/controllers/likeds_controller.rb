class LikedsController < ApplicationController
  before_action :set_liked, only: %i[ show edit update destroy ]

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
    @liked = Liked.new(liked_params)

    respond_to do |format|
      if @liked.save
        format.html { redirect_to liked_url(@liked), notice: "Liked was successfully created." }
        format.json { render :show, status: :created, location: @liked }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @liked.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /likeds/1 or /likeds/1.json
  def update
    respond_to do |format|
      if @liked.update(liked_params)
        format.html { redirect_to liked_url(@liked), notice: "Liked was successfully updated." }
        format.json { render :show, status: :ok, location: @liked }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @liked.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /likeds/1 or /likeds/1.json
  def destroy
    @liked.destroy

    respond_to do |format|
      format.html { redirect_to likeds_url, notice: "Liked was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_liked
      @liked = Liked.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def liked_params
      params.require(:liked).permit(:post_id, :user_id)
    end
end
