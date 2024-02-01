class Contestant < ApplicationRecord
    validates :name, presence: true
    validates :years_of_experience, presence: true
    validates :has_representative, presence: true

    belongs_to :pageant
end