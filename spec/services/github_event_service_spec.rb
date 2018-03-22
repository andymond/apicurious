require "rails_helper"

describe GithubEventService do
  let(:user) { double(oauth_token: ENV['GITHUB_ACCESS_TOKEN'], nickname: "andymond") }
  let(:service) { GithubEventService.new(user) }

  it "returns json of recent user activity" do
    VCR.use_cassette("event_info") do
      user_events = service.user_events

      expect(user_events).to be_an(Array)
      expect(user_events.count).to eq(30)
      expect(user_events.first).to have_key(:type)
      expect(user_events.first).to have_key(:actor)
      expect(user_events.first).to have_key(:repo)
      expect(user_events.first).to have_key(:payload)
      expect(user_events.first).to have_key(:public)
      expect(user_events.first).to have_key(:created_at)
    end
  end

  it "returns commits for specific event" do
    VCR.use_cassette("commit_info") do
      url = service.user_events.first[:payload][:pull_request][:commits_url]
      commits = service.get_commits(url)

      expect(commits).to be_an(Array)
    end
  end
end
