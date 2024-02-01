class Pageant < ApplicationRecord
    validates :name, presence: true
    validates :scheduled, presence: true
    validates :version_number, presence: true

    has_many :contestants
end