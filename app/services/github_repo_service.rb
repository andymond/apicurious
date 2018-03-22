class GithubRepoService
  include ServiceHelpers

  def initialize(current_user, page)
    @conn = Faraday.new(url: "https://api.github.com")
    @current_user = current_user
    @page = page
  end

  def user_repos
    get_json("/users/#{@current_user.nickname}/repos?access_token=#{@current_user.oauth_token}&sort=pushed&page=#{@page}")
  end

end
