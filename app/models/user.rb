class User < ApplicationRecord
    has_secure_password
    has_secure_password :pin, validations: false
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: {minimum: 8}, format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]+\z/, message: "A password must include capital, small letters, numbers, and symbols"}
    validates :pin, presence: true, length: {is: 6}, format: { with: /\A[0-9]{6}\z/, message: "Insert 6 digits" }, if: :validate_pin?

    private
    def validate_pin? #for pin logins
        pin.present?
    end
end
