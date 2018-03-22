require "rails_helper"

feature "user visits dashboard" do
  it "displays github profile info from api" do
    user = User.create(oauth_token: ENV['GITHUB_ACCESS_TOKEN'])
    user_url = "https://api.github.com/user?access_token=#{user.oauth_token}"
    starred_url = "https://api.github.com/user/starred?access_token=#{user.oauth_token}"

    stub_get("user_info.json", user_url)
    stub_get("starred_info.json", starred_url)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_index_path

    expect(page).to have_content("Denver, CO")
    expect(page).to have_content("Repositories 41")
    expect(page).to have_content("Stars 1")
    expect(page).to have_content("Followers 3")
    expect(page).to have_content("Following 4")
  end
end
