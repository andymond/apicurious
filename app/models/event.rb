class Event

  def initialize(user = nil, attributes)
    @user = user
    @attributes = attributes
  end

  def month
    date = attributes[:created_at].split("-")
    y, m = date[0], date[1]
    Time.new(y, m).strftime("%B %Y")
  end

  def commits
    attributes[:payload][:commits]
  end

  def commit_count
    attributes[:payload][:commits].count
  end

  def repo
    attributes[:repo][:name]
  end

  private
    attr_reader :attributes, :user
end
