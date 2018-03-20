class User < ApplicationRecord

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid  = auth_info.uid
      new_user.name  = auth_info.name
      new_user.screenname  = auth_info.screen_name
      new_user.oauth_token  = auth_info.credentials.token
      new_user.oauth_token_secret  = auth_info.credentials.secret
    end
  end
end
