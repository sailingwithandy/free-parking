class User < ApplicationRecord

  has_many :reservations
  
  mount_uploader :avatar, AvatarUploader

  include Clearance::User
     has_many :authentications, dependent: :destroy

    def self.create_with_auth_and_hash(authentication, auth_hash)
      # random_password = 
     
      user = self.create!(
        name: auth_hash["extra"]["raw_info"]["name"],
        email: auth_hash["extra"]["raw_info"]["email"],
        password: rand(36**9).to_s(36) 
      )
      user.authentications << authentication
      return user
    end

    # grab fb_token to access Facebook for user data
    def fb_token
      x = self.authentications.find_by(provider: 'facebook')
      return x.token unless x.nil?
    end

    
end
