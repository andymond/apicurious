class GithubService
  include ServiceHelpers

  def initialize(current_user)
    @conn = Faraday.new(url: "https://api.github.com")
    @current_user = current_user
  end

  def user_info
    get_json("/user?access_token=#{@current_user.oauth_token}")
  end

  def user_stars
    get_json("/user/starred?access_token=#{@current_user.oauth_token}")
  end

end
