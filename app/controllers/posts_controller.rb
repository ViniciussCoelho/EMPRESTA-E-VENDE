class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :set_community
  before_action :set_community_participant

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
    @community = Community.find(params[:community_id])
    @post = Post.find(params[:id])
    @comment = Comment.new
    @liked = Liked.find_by(post_id: @post.id, user_id: @community_participant.user.id) || Liked.new
    @back_path = community_path(@community)
  end

  # GET /posts/new
  def new
    @post = Post.new
    @back_path = community_path(@community)
  end

  # GET /posts/1/edit
  def edit
    @back_path = community_post_path(@community, @post)
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to community_post_url(@community, @post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to community_post_url(@community, @post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to community_posts_url(@community), notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def set_community
      @community = Community.find(params[:community_id])
    end

    def set_community_participant
      @community_participant = CommunityParticipant.where(community_id: params[:community_id], user_id: current_user.id).first
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :description, images: []).merge(community_participant_id: @community_participant.id)
    end
end
