require 'rails_helper'

RSpec.describe 'Contestant Show', type: :feature do
 describe 'As a Visitor' do
  before(:each) do
    @pageant2 = Pageant.create!(name: "Miss Universe", scheduled: true, version_number: 25)
    @contestant1 = @pageant2.contestants.create!(name: "Colombia", years_of_experience: 57, has_representative: true)
    @contestant2 = @pageant2.contestants.create!(name: "Peru", years_of_experience: 75, has_representative: true)
  end

  #User Story 3, Child Index
  it "shows each contestant with it's attributes" do
    visit '/contestants'

    expect(page).to have_content(@contestant1.name)
    expect(page).to have_content(@contestant1.years_of_experience)
    expect(page).to have_content(@contestant1.has_representative )
    expect(page).to have_content(@contestant2.name)
    expect(page).to have_content(@contestant2.years_of_experience)
    expect(page).to have_content(@contestant2.has_representative )
  end
 end
end