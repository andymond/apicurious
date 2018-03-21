class GithubUser
  attr_reader :attributes,
              :stars,
              :location,
              :bio,
              :repos,
              :followers,
              :following

  def initialize(user_info, user_stars = nil)
    @attributes = JSON.parse(user_info, symbolize_names: true)
    @stars = JSON.parse(user_stars, symbolize_names: true)
    @location = attributes[:location]
    @bio = attributes[:bio]
    @repos = attributes[:public_repos]
    @followers = attributes[:followers]
    @following = attributes[:following]
  end

end
