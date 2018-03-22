class GithubRepoService
  include ServiceHelpers

  def initialize(user, page = "1")
    @user = user
  end

  def user_repos
    get_json("/users/#{@current_user.nickname}/repos?access_token=#{@current_user.oauth_token}&sort=pushed")
  end

end
