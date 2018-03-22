require "rails_helper"

feature "user visits dashboard" do
  it "dispalys pinned repos for user from api" do
    user = User.create(oauth_token: ENV['GITHUB_ACCESS_TOKEN'])
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_index_path
    click_on "Repositories"

    expect(page).to have_content("rails_engine")
    expect(page).to have_content("menu_manager")
    expect(page).to have_content("http_yeah_you_know_me")
    expect(page).to have_content("job-tracker")
    expect(page).to have_content("jungle_beats")
    expect(page).to have_content("night_writer")
  end
end
