class GithubUser
  attr_reader :page

  def initialize(user, page = 1)
    @gh_service = GithubService.new(user)
    @user = user
    @page = page.to_i
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

  def repos
    GithubRepoService.new(user, page).user_repos.map do |repo|
      Repo.new(repo)
    end
  end

  def events
    events ||= GithubEventService.new(user).user_events.map do |event|
      Event.new(user, event) if event[:payload].has_key?(:commits)
    end.compact
  end

  def commits_by_repo
    events_by_repo = events.group_by { |event| event.repo }
    events_by_repo.transform_values do |event_array|
      event_array.reduce(0) do |memo, event|
        memo += event.commit_count
      end
    end
  end

  private
    attr_reader :attributes, :gh_service, :user

    def attributes
      @attributes ||= gh_service.user_info
    end


end
