require "rails_helper"

describe GithubUser do
  describe "instance methods" do
    user = User.create(oauth_token: ENV['GITHUB_ACCESS_TOKEN'], nickname: "andymond")

    it "#events returns users most recent push events" do
      VCR.use_cassette("user_info") do
        VCR.use_cassette("event_info") do
          github_user = GithubUser.new(user)

          expect(github_user.events.count).to eq(7)
        end
      end
    end
  end
end
