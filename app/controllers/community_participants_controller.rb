class CommunityParticipantsController < ApplicationController
  before_action :set_community_participant, only: %i[ show edit update destroy ]
  before_action :set_community

  # GET /community_participants or /community_participants.json
  def index
    @community_participants = CommunityParticipant.all
  end

  # GET /community_participants/1 or /community_participants/1.json
  def show
  end

  # GET /community_participants/new
  def new
    @community_participant = CommunityParticipant.new
  end

  # GET /community_participants/1/edit
  def edit
  end

  # POST /community_participants or /community_participants.json
  def create
    @community_participant = CommunityParticipant.new(community_participant_params)

    respond_to do |format|
      if @community_participant.save
        format.html { redirect_to community_community_participant_url(@community, @community_participant), notice: "Community participant was successfully created." }
        format.json { render :show, status: :created, location: @community_participant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @community_participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /community_participants/1 or /community_participants/1.json
  def update
    respond_to do |format|
      if @community_participant.update(community_participant_params)
        format.html { redirect_to community_community_participant_url(@community, @community_participant), notice: "Community participant was successfully updated." }
        format.json { render :show, status: :ok, location: @community_participant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @community_participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /community_participants/1 or /community_participants/1.json
  def destroy
    @community_participant.destroy

    respond_to do |format|
      format.html { redirect_to community_community_participants_url(@community), notice: "Community participant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_community_participant
      @community_participant = CommunityParticipant.find(params[:id])
    end

    def set_community
      @community = Community.find(params[:community_id])
    end

    # Only allow a list of trusted parameters through.
    def community_participant_params
      default_params = { community_id: @community, user_id: current_user.id, role: 0 }
      params.permit(:community_id, :user_id, :role).reverse_merge(default_params)
    end
    
end
