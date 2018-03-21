class DashboardController < ApplicationController

  def index
    response = Faraday.get("https://api.github.com/user?access_token=#{current_user.oauth_token}")
    @user = GithubUser.new(response.body)
  end

end
