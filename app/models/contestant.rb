class Contestant < ApplicationRecord
  validates :name, presence: true
  validates :years_of_experience, presence: true

  belongs_to :pageant

  def self.order_alpha
    self.all.order(:name)
  end
end