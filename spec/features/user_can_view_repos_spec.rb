require "rails_helper"

feature "user visits dashboard" do
  it "displays user repos from api" do
    user = User.create(nickname: "andymond", oauth_token: ENV['GITHUB_ACCESS_TOKEN'])
    user_url = "https://api.github.com/user?access_token=#{user.oauth_token}"
    starred_url = "https://api.github.com/user/starred?access_token=#{user.oauth_token}"
    repos_url = "https://api.github.com/users/#{user.nickname}/repos?access_token=#{user.oauth_token}&sort=pushed&page=1"

    stub_get("user_info.json", user_url)
    stub_get("starred_info.json", starred_url)
    stub_get("repos_info.json", repos_url)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_index_path
    click_on "Repositories"

    expect(page).to have_content("rails_engine")
    expect(page).to have_content("menu_manager")
    expect(page).to have_content("http_yeah_you_know_me")
    expect(page).to have_content("job-tracker")
    expect(page).to have_content("credit_check")
    expect(page).to have_content("jesskleinart")
  end
end
