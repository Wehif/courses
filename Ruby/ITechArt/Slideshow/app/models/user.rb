class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, :omniauth_providers => [:google_oauth2, :linkedin, :twitter]

  ROLES = %i[admin moderator author banned]

  mount_uploader :avatar, AvatarUploader

  def self.find_for_google_oauth2 (access_token, current_user)
    data = access_token.info
    user = User.where(:email => data["email"]).first
    # Uncomment the section below if you want users to be created if they don't exist
    unless user
         user = User.create(nickname: data["name"],
            email: data["email"],
            password: Devise.friendly_token[0,20],
            avatar: data["image"]
        )
    end
    user
    #else
     # User.create!(:provider => access_token.provider, :url => access_token.info.urls.Google, :username => access_token.extra.raw_info.name, :nickname => access_token.extra.raw_info.username, :email => access_token.extra.raw_info.email, :password => Devise.friendly_token[0,20])
  end

  def self.find_for_twitter_oauth (access_token, current_user)
    data = access_token.info
    user = User.where(:email => data["email"]).first
    unless user
      user = User.create(nickname: data["name"],
                       email: data["email"],
                       password: Devise.friendly_token[0,20]
      )
    end
  user
  end

  def self.find_for_linkedin_oauth (access_token, current_user)
    data = access_token.info
    user = User.where(:email => data["email"]).first
    unless user
      user = User.create(nickname: data["name"],
                         email: data["email"],
                         password: Devise.friendly_token[0,20]
      )
    end
    user
  end
end
