class User < ApplicationRecord
    has_many :songs
    has_many :musicians, through: :songs
    validates :email, uniqueness: true, presence: true
    has_secure_password

    def self.create_by_github_omniauth(auth)
        self.find_or_create_by(email: auth[:info][:email]) do |u|
          u.password = SecureRandom.hex
    
        end
    end

end
