require 'rails_helper'

RSpec.describe 'Pageants Index', type: :feature do
 describe 'As a visitor' do
  before(:each) do
    @pageant1 = Pageant.create!(name: "Miss Colombia", scheduled: true, version_number: 10)
    @pageant2 = Pageant.create!(name: "Miss Universe", scheduled: true, version_number: 25)
    @contestant1 = @pageant2.contestants.create!(name: "Colombia", years_of_experience: 57, has_representative: true)
    @contestant2 = @pageant2.contestants.create!(name: "Peru", years_of_experience: 75, has_representative: true)
  end

  # User Story 1, Parent Index
  it 'can see the name of each pageant record in the system' do
    visit "/pageants"

    expect(page).to have_content(@pageant1.name)
    expect(page).to have_content(@pageant2.name)
  end

  #User Story 5, Parent Children Index
  it 'has a link to a list of children associated with it' do
    visit "/pageants/#{@pageant2.id}"

    expect(page).to have_link(href: "/pageants/#{@pageant2.id}/contest")
  end
 end
end