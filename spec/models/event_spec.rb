require "rails_helper"

describe Event do
  describe "instance methods" do
    user = User.create(oauth_token: ENV['GITHUB_ACCESS_TOKEN'], nickname: "andymond")

    it "#month displays month and year of displayed event" do
      VCR.use_cassette("event_info") do
        service = GithubEventService.new(user)
        event = Event.new(user, service.user_events.first)

        expect(event.month).to eq("March 2018")
      end
    end

    it "returns its commits" do
      VCR.use_cassette("commit_info") do
        service = GithubEventService.new(user)
        event = Event.new(user, service.user_events.first)

        expect(event.commits.count).to eq(3)
      end
    end
  end
end
