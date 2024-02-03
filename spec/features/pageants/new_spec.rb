require 'rails_helper'

RSpec.describe 'Pageants Index', type: :feature do
 describe 'As a visitor' do
  before(:each) do
    @pageant1 = Pageant.create!(name: "Miss Colombia", scheduled: true, version_number: 10)
    @pageant2 = Pageant.create!(name: "Miss Universe", scheduled: true, version_number: 25)
    @contestant1 = @pageant2.contestants.create!(name: "Colombia", years_of_experience: 57, has_representative: true)
    @contestant2 = @pageant2.contestants.create!(name: "Peru", years_of_experience: 75, has_representative: true)
  end
  
  # User Story 11, Pageant Creation 
  it 'shows a form for a new pageant record' do
    visit "/pageants/new"

    expect(page).to have_content("Register a new Pageant")
    expect(page).to have_field("Name")
    expect(page).to have_field("Scheduled")
    expect(page).to have_button("Create Pageant")
  end

  it "can create a new pageant" do
    visit "/pageants/new"

    fill_in("Name", with: "Miss Peru")
    select('True', from: "Scheduled")
    find("#version_number", wait: 10).set("29")
    
    click_button("Create Pageant")

    expect(current_path).to eq("/pageants")

    expect(page).to have_content("Miss Peru")
  end
  
 end
end