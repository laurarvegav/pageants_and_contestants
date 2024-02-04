require 'rails_helper'

RSpec.describe 'Contestant Show', type: :feature do
 describe 'As a Visitor' do
  before(:each) do
    @pageant2 = Pageant.create!(name: "Miss Universe", scheduled: true, version_number: 25)
    @contestant1 = @pageant2.contestants.create!(name: "Colombia", years_of_experience: 57, has_representative: true)
    @contestant2 = @pageant2.contestants.create!(name: "Peru", years_of_experience: 75, has_representative: true)
    @contestant3 = @pageant2.contestants.create!(name: "USA", years_of_experience: 90, has_representative: false)
  end

  #User Story 3, Child Index
  it "shows each contestant with it's attributes" do
    visit '/contestants'

    expect(page).to have_content(@contestant1.name)
    expect(page).to have_content(@contestant1.years_of_experience)
    expect(page).to have_content(@contestant1.has_representative)
    expect(page).to have_content(@contestant2.name)
    expect(page).to have_content(@contestant2.years_of_experience)
    expect(page).to have_content(@contestant2.has_representative)
  end

  # User Story 8, Child Index Link
  it "shows a link at the top of the page that takes me to the Child Index" do
    visit '/contestants'

    expect(page).to have_link(href: "/contestants")
  end

  #User Story 15, Child Index only shows `true` Records 
  it "only shows contestants that have a representative" do
    visit '/contestants'

    expect(page).to have_content("true")
    expect(page).to have_no_content("false")
  end

  # User Story 18, Child Update From Index Page 
  it "shows link to edit Contestant" do
    visit "/contestants"
save_and_open_page
    expect(page).to have_link("Edit Contestant #{@contestant1.name}", href: "/contestants/#{@contestant1.id}/edit")
    expect(page).to have_link("Edit Contestant #{@contestant2.name}", href: "/contestants/#{@contestant2.id}/edit")
  end

  it "takes me to that contestant edit page where I can update its information just like in User Story 12" do
    visit "/contestants"
    click_link("Edit Contestant #{@contestant1.name}")
    
    expect(current_path).to eq("/contestants/#{@contestant1.id}/edit")
  end
 end
end