class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: {minimum: 8}, format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]+\z/, message: "must include capital, small letters, numbers, and symbols"}
    validates :pin, presence: true, length: {is: 4}, format: { with: /\A[0-9]{4}\z/, message: "Insert 4 digits" }
end
