require "rails_helper"

RSpec.describe Pageant, type: :model do
    it { should have_many :contestants }
end