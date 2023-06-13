class DashboardController < ApplicationController
  def index
  end

  def my_contents
    @contents = current_user.communities

    respond_to do |format|
        format.html
    end
  end

  def find_communities
    @communities = Community.where.not(id: current_user.communities.ids)

    respond_to do |format|
        format.html
    end
  end
end
