class GithubService

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

  private

    def get_json(url)
      response = @conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end

end
