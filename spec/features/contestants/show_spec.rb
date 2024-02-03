require 'rails_helper'

RSpec.describe 'Contestant Show', type: :feature do
 describe 'As a Visitor' do
  before(:each) do
    @pageant2 = Pageant.create!(name: "Miss Universe", scheduled: true, version_number: 25)
    @contestant1 = @pageant2.contestants.create!(name: "Colombia", years_of_experience: 57, has_representative: true)
    @contestant2 = @pageant2.contestants.create!(name: "Peru", years_of_experience: 75, has_representative: true)
  end

  # User Story 4, Child Show
  it 'can see the contestant and all its attributes' do
    visit "/contestants/#{@contestant1.id}"

    expect(page).to have_content(@contestant1.name)
    expect(page).to have_content("Has: #{@contestant1.years_of_experience} years of experience")
    expect(page).to have_content(@contestant1.has_representative)
  end

   # User Story 8, Child Index Link
   it "shows a link at the top of the page that takes me to the Child Index" do
    visit "/contestants/#{@contestant2.id}"

    expect(page).to have_link(href: "/contestants")
  end
 end
end