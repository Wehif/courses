class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, :omniauth_providers => [:google_oauth2, :linkedin, :twitter]

  def self.find_for_google_oauth2 (access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first
    # Uncomment the section below if you want users to be created if they don't exist
    # unless user
    #     user = User.create(name: data["name"],
    #        email: data["email"],
    #        password: Devise.friendly_token[0,20]
    #     )
    # end
    user
    #else
     # User.create!(:provider => access_token.provider, :url => access_token.info.urls.Google, :username => access_token.extra.raw_info.name, :nickname => access_token.extra.raw_info.username, :email => access_token.extra.raw_info.email, :password => Devise.friendly_token[0,20])
  end

  def self.find_for_twitter_oauth (access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first
    #if user = User.where(:url => access_token.info.urls.Twitter).first
    user
    #else
      #User.create!(:provider => access_token.provider, :url => access_token.info.urls.Twitter, :username => access_token.extra.raw_info.name, :nickname => access_token.extra.raw_info.username, :email => access_token.extra.raw_info.email, :password => Devise.friendly_token[0,20])
    #end
  end
  def self.find_for_linkedin_oauth (access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first
    #if user = User.where(:url => access_token.info.urls.LinkedIn).first
    user
    #else
    #  User.create!(:provider => access_token.provider, :url => access_token.info.urls.LinkedIn, :username => access_token.extra.raw_info.name, :nickname => access_token.extra.raw_info.username, :email => access_token.extra.raw_info.email, :password => Devise.friendly_token[0,20])
    #end
  end
end
