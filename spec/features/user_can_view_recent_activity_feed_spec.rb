require "rails_helper"

describe "User can view recent activity feed" do
  context "from their dashboard" do
    it "displays recent activity" do
      user = User.create(oauth_token: ENV["GITHUB_ACCESS_TOKEN"], nickname: "andymond")
      user_url = "https://api.github.com/user?access_token=#{user.oauth_token}"
      starred_url = "https://api.github.com/user/starred?access_token=#{user.oauth_token}"
      event_url = "https://api.github.com/users/andymond/events?access_token=#{user.oauth_token}"

      stub_get("user_info.json", user_url)
      stub_get("starred_info.json", starred_url)
      stub_get("event_info.json", event_url)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_index_path

      expect(page).to have_content("Contribution Activity")
      expect(page).to have_content("March 2018")
      expect(page).to have_content("Created 54 commits in andymond/apicurious")
    end
  end
end
