require "rails_helper"

describe GithubRepoService do
  let(:user) { double(oauth_token: ENV['GITHUB_ACCESS_TOKEN'], nickname: "andymond") }
  let(:service) { GithubRepoService.new(user, 1) }

  it "returns user information from GithubApi" do
    VCR.use_cassette("repo_info") do
      repos = service.user_repos

      expect(repos).to be_an(Array)
      expect(repos.first[:name]).to eq("apicurious")
      expect(repos.first[:owner][:login]).to eq("andymond")
    end
  end
end
