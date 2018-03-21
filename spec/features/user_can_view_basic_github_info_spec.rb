require "rails_helper"

feature "user visits dashboard" do
  it "displays github profile info from api" do
    user = User.create(oauth_token: ENV['GITHUB_ACCESS_TOKEN'])
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_index_path

    expect(page).to have_content("Denver, CO")
    expect(page).to have_content("Repositories 41")
    expect(page).to have_content("Stars 1")
    expect(page).to have_content("Followers 3")
    expect(page).to have_content("Following 4")
  end
end
