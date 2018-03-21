class DashboardController < ApplicationController

  def index
    user_response = Faraday.get("https://api.github.com/user?access_token=#{current_user.oauth_token}")
    stars_response = Faraday.get("https://api.github.com/user/starred?access_token=#{current_user.oauth_token}")
    @user = GithubUser.new(user_response.body, stars_response.body)
  end

end
