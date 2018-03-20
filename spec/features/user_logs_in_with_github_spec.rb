require "rails_helper"

def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
   "provider"=>"github",
   "uid"=>"30162156",
   "info"=>
    {"nickname"=>"andymond",
     "email"=>"andy.dymond@gmail.com",
     "name"=>"Andy Dymond",
     "image"=>"https://avatars2.githubusercontent.com/u/30162156?v=4",
     "credentials"=>{"token"=>"abcdefhijklmnopqrstuvwxyz1234567890", "expires"=>false}
    }
  })
end

feature  "user logs in" do
  it "allows log in with github credentials" do
    stub_omniauth
    visit root_path
    click_on "Log in with GitHub"

    expect(current_path).to eq(dashboard_index_path)
    expect(page).to have_content(stub_omniauth["info"]["name"])
    expect(page).to have_content(stub_omniauth["info"]["nickname"])
    expect(page).to have_content(stub_omniauth["info"]["email"])
  end
end
