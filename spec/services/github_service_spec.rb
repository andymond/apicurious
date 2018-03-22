require "rails_helper"

describe GithubService do
  let(:user) { double(oauth_token: ENV['GITHUB_ACCESS_TOKEN']) }
  let(:service) { GithubService.new(user) }

  it "returns user information from GithubApi" do
    VCR.use_cassette("user_info") do
      user_info = service.user_info

      expect(user_info).to be_a(Hash)
      expect(user_info[:login]).to eq("andymond")
      expect(user_info[:id]).to eq(30162156)
      expect(user_info[:bio]).to eq("Software Developer \r\n@ Turing School of Software and Design. ")
      expect(user_info[:public_repos]).to eq(41)
      expect(user_info[:followers]).to eq(3)
      expect(user_info[:following]).to eq(4)
    end
  end
end
