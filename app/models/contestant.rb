class Contestant < ApplicationRecord
    validates :name, presence: true
    validates :years_of_experience, presence: true

    belongs_to :pageant
end