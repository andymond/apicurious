class Event

  def initialize(user, attributes)
    @user = user
    @attributes = attributes
  end

  def month
    date = attributes[:created_at].split("-")
    y, m = date[0], date[1]
    Time.new(y, m).strftime("%B %Y")
  end

  def commits
    url = attributes[:payload][:pull_request][:commits_url]
    GithubEventService.new(user).get_commits(url)
  end

  private
    attr_reader :attributes, :user
end
