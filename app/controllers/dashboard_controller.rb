class DashboardController < ApplicationController

  def index
    @user = GithubUser.new(current_user)
  end

end
