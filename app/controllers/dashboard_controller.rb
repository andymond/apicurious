class DashboardController < ApplicationController

  def index
    github_service = GithubService.new(current_user)
    user_info = github_service.user_info
    stars = github_service.user_stars
    @user = GithubUser.new(user_info, stars)
  end

end
