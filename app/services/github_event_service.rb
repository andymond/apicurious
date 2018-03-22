class GithubEventService
  include ServiceHelpers

  def initialize(user)
    @conn = Faraday.new("https://api.github.com")
    @user = user
  end

  def user_events
    get_json("users/#{@user.nickname}/events?access_token=#{@user.oauth_token}")
  end

  def get_commits(url)
    get_json("#{url}?access_token=#{@user.oauth_token}")
  end
end
