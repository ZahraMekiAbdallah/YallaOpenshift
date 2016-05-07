class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook,:google_oauth2]

  has_many :orders
  has_many :groups
  has_many :notifications

  has_many :friendships
  has_many :friends, :through => :friendships


  has_many      :sent, 
                :class_name => "Notification",
                :foreign_key  => "sent_id"

  has_many      :received, 
                :class_name => "Notification", 
                :foreign_key  => "received_id"

   attr_accessor 'just_signed_up'   

  mount_uploader :avatar, AvatarUploader      

# Setup accessible (or protected) attributes for your model
#attr_accessible :email, :password, :remember_me, :name


#   def self.from_omniauth(auth)
#   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
#     user.email = auth.info.email
#     user.password = Devise.friendly_token[0,20]
#     user.name = auth.info.name   # assuming the user model has a name
#     user.image = auth.info.image # assuming the user model has an image
#     user.oauth_token = auth.credentials.token
#     user.oauth_expires_at = Time.at(auth.credentials.expires_at)
#     user.save!
#   end
# end 

def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.name = auth.info.name
        user.password = Devise.friendly_token[0,20]
      end 
    end

# def self.from_omniauth(auth)
#   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
#     user.email = auth.info.email
#     user.password = Devise.friendly_token[0,20]
#     user.name = auth.info.name   # assuming the user model has a name
#     #user.image = auth.info.image # assuming the user model has an image
#   end
# end 

# def self.new_with_session(params, session)
#     super.tap do |user|
#       if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
#         user.email = data["email"] if user.email.blank?
#       end
#     end
#   end             



end


