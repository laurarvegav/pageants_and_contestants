require 'rails_helper'

RSpec.describe 'Pageants Contest', type: :feature do
 describe 'As a visitor' do
  before(:each) do
    @pageant1 = Pageant.create!(name: "Miss Colombia", scheduled: true, version_number: 10)
    @pageant2 = Pageant.create!(name: "Miss Universe", scheduled: true, version_number: 25)
    @contestant1 = @pageant2.contestants.create!(name: "Colombia", years_of_experience: 57, has_representative: true)
    @contestant2 = @pageant2.contestants.create!(name: "Peru", years_of_experience: 75, has_representative: true)
  end

  #User Story 5, Parent Children Index
  it 'has a list of the associated childrens attributes' do
    visit "/pageants/#{@pageant2.id}/contest"

    expect(page).to have_content(@contestant1.name)
    expect(page).to have_content(@contestant1.years_of_experience)
    expect(page).to have_content(@contestant1.has_representative)

    expect(page).to have_content(@contestant2.name)
    expect(page).to have_content(@contestant2.years_of_experience)
    expect(page).to have_content(@contestant2.has_representative)
  end

  # User Story 8, Child Index Link
  it "shows a link at the top of the page that takes me to the Child Index" do
    visit "/pageants/#{@pageant2.id}/contest"

    expect(page).to have_link(href: "/contestants")
  end

  # User Story 9, Parent Index Link
  it "shows a link at the top of the page that takes me to the Pageant Index" do
    visit "/pageants/#{@pageant2.id}/contest"

    expect(page).to have_link(href: "/pageants")
  end
 end
end