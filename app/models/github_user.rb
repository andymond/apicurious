class GithubUser
  attr_reader :attributes,
              :stars,
              :location,
              :bio,
              :repos,
              :followers,
              :following

  def initialize(attributes, stars)
    @attributes = attributes
    @stars = stars
    @location = attributes[:location]
    @bio = attributes[:bio]
    @repos = attributes[:public_repos]
    @followers = attributes[:followers]
    @following = attributes[:following]
  end

end
