
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    devise :omniauthable, :omniauth_providers => [:facebook]
    validates :fullname, presence: true, length: {maximum: 50}
    has_many :products
    devise :registerable, :confirmable
    before_create :confirmation_token
    def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.fullname = auth.info.name   # assuming the user model has a name
        # user.image = auth.info.image # assuming the user model has an image
        end
    end
    def email_activate
        self.email_confirmed = true
        self.confirm_token = nil
        save(:validate => false)
    end
    private

    def confirmation_token
        if self.confirm_token.blank?
            self.confirm_token= SecureRandom.urlsafe_based64.to_s
        end
    end
end
