class RepositoriesController < ApplicationController

  def index
    @user = GithubUser.new(current_user, set_page)
  end

  private

  def set_page
    if params[:page].nil?
      1
    else
      params[:page]
    end
  end

end
