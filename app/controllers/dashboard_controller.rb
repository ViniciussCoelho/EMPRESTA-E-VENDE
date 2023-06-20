class DashboardController < ApplicationController
  def index
  end

  def my_contents
    @my_communities = current_user.communities
    @my_liked_ads = current_user.likeds
    respond_to do |format|
        format.html
    end
  end

  def find_communities
    @communities = Community.where.not(id: current_user.communities.pluck(:id))
    respond_to do |format|
        format.html
    end
  end
end
