class GithubUser
  attr_reader :attributes, :location, :bio, :repos, :followers, :following

  def initialize(json)
    @attributes = JSON.parse(json, symbolize_names: true)
    @location = attributes[:location]
    @bio = attributes[:bio]
    @repos = attributes[:public_repos]
    @followers = attributes[:followers]
    @following = attributes[:following]
  end

end
