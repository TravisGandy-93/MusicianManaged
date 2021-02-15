class User < ApplicationRecord
    has_many :songs
    has_many :musicians, through: :songs
    validates :email, uniqueness: true, presence: true
    has_secure_password

end
