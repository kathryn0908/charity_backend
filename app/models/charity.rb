class Charity < ApplicationRecord
    has_many :donations
    has_many :users, through: :donations

    has_many :favorites
    has_many :users, through: :favorites
end
