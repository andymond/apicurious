require "rails_helper"

feature "user visits dashboard" do
  it "displays pinned repos for user from api" do
    user = User.create(nickname: "andymond", oauth_token: ENV['GITHUB_ACCESS_TOKEN'])
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_index_path
    click_on "Repositories"

    expect(page).to have_content("rails_engine")
    expect(page).to have_content("menu_manager")
    expect(page).to have_content("http_yeah_you_know_me")
    expect(page).to have_content("job-tracker")
    expect(page).to have_content("credit_check")
    expect(page).to have_content("jesskleinart")

    click_on "2"
  end
end
