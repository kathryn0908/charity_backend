class User < ApplicationRecord
    has_secure_password
    
    has_many :donations
    has_many :charities, through: :donations

    has_many :favorites
    has_many :charities, through: :favorites
end
