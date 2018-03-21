class GithubUser

  def initialize(user)
    @gh_service = GithubService.new(user)
  end

  def location
    attributes[:location]
  end

  def bio
    attributes[:bio]
  end

  def repo_count
    attributes[:public_repos]
  end

  def follower_count
    attributes[:followers]
  end

  def following_count
    attributes[:following]
  end

  def stars
    @gh_service.user_stars
  end


  private
    attr_reader :attributes, :gh_service

    def attributes
      @attributes ||= gh_service.user_info
    end

end
