class User < ApplicationRecord

  def self.parsed_auth_info(auth_info)
    {uid: auth_info["uid"],
     name: auth_info["info"]["name"],
     nickname: auth_info["info"]["nickname"],
     email: auth_info["info"]["email"],
     image_url: auth_info["info"]["image"],
     oauth_token: auth_info["info"]["credentials"]}
  end

  def self.from_omniauth(auth_info)
    user_info = parsed_auth_info(auth_info)
    if user = User.find_by(uid: user_info[:uid])
      user.update(user_info)
      User.find(user.id)
    else
      User.create(user_info)
    end
  end
end
