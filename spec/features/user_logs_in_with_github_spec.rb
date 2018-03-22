require "rails_helper"

def fake_token
  "abcdefhijklmnopqrstuvwxyz1234567890"
end

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
   },
   "credentials"=>{"token"=>fake_token, "expires"=>false
    }
  })
end

feature  "user logs in" do
  it "allows log in with github credentials" do
    stub_omniauth
    user_url = "https://api.github.com/user?access_token=#{fake_token}"
    starred_url = "https://api.github.com/user/starred?access_token=#{fake_token}"
    stub_get("user_info.json", user_url)
    stub_get("user_info.json", starred_url)

    visit root_path
    click_on "Log in with GitHub"

    expect(current_path).to eq(dashboard_index_path)
    expect(page).to have_content(stub_omniauth["info"]["name"])
    expect(page).to have_content(stub_omniauth["info"]["nickname"])
    expect(page).to have_content(stub_omniauth["info"]["email"])
  end
end
