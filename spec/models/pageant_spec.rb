require "rails_helper"

RSpec.describe Pageant, type: :model do
  it { should have_many :contestants }

  describe "#Contestant Class Methods" do
    before do
      @pageant1 = Pageant.create!(name: "Miss Colombia", scheduled: true, version_number: 10)
      @pageant2 = Pageant.create!(name: "Miss Universe", scheduled: true, version_number: 25)
      @contestant1 = @pageant2.contestants.create!(name: "Colombia", years_of_experience: 57, has_representative: true)
      @contestant2 = @pageant2.contestants.create!(name: "Peru", years_of_experience: 75, has_representative: true)
    end 

    it 'can order contestants' do
      ordered = @pageant2.contestants.order_alpha
  
      expect(ordered).to eq([@contestant1, @contestant2])
    end
  
    it 'can return the contestants that meet the years of experience treshold' do
      sample = @pageant2.contestants.sample_experience(60)

      expect(sample).to eq([@contestant2])

      sample = @pageant2.contestants.sample_experience(80)

      expect(sample).to eq([])
    end
  end
end