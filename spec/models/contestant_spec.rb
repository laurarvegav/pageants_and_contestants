require "rails_helper"

RSpec.describe Contestant, type: :model do
    it { should belong_to :pageant }
end