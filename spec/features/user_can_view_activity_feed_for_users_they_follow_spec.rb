require "rails_helper"

describe "user can view activity of users they follow" do
  it "displays activity of users followed by user" do
    user = User.create(nickname: "andymond", oauth_token: ENV['GITHUB_ACCESS_TOKEN'])
    user_url = "https://api.github.com/user?access_token=#{user.oauth_token}"
    starred_url = "https://api.github.com/user/starred?access_token=#{user.oauth_token}"
    followers_url = "https://api.github.com/user/following?access_token=#{user.oauth_token}"

    stub_get("user_info.json", user_url)
    stub_get("starred_info.json", starred_url)
    stub_get("following_info.json", followers_url)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_index_path
    click_on "Following"

    expect(page).to have_content("Jared McDonald")
    expect(page).to have_content("Add new file")
    expect(page).to have_content("Jasmin ")
    expect(page).to have_content("Add first round of changes")
    expect(page).to have_content("James Logue")
    expect(page).to have_content("Update accordian tab html, styling to add header and placeholder img div")
    expect(page).to have_content("Luis Senior")
    expect(page).to have_content("Add update.")
  end
end
