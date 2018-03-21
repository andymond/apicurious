class GithubUser
  attr_reader :attributes,
              :location,
              :bio,
              :repos,
              :followers,
              :following

  def initialize(user)
    @gh_service = GithubService.new(user)
    @attributes = @gh_service.user_info
    @location = attributes[:location]
    @bio = attributes[:bio]
    @repos = attributes[:public_repos]
    @followers = attributes[:followers]
    @following = attributes[:following]
  end

  def stars
    @gh_service.user_stars
  end

end
