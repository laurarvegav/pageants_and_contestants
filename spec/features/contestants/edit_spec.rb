require 'rails_helper'

RSpec.describe 'Contestant Show', type: :feature do
 describe 'As a Visitor' do
  before(:each) do
    @pageant2 = Pageant.create!(name: "Miss Universe", scheduled: true, version_number: 25)
    @contestant1 = @pageant2.contestants.create!(name: "Colombia", years_of_experience: 57, has_representative: true)
    @contestant2 = @pageant2.contestants.create!(name: "Peru", years_of_experience: 75, has_representative: true)
  end

  #User Story 14, Child Update
  it "shows a form to edit the child's attributes" do
    visit "/contestants/#{@contestant1.id}/edit"

    expect(page).to have_content("Update Contestant")
    expect(page).to have_field("Name")
    expect(page).to have_field("Years of experience")
    expect(page).to have_field("Has representative")
    expect(page).to have_button("Update Contestant")
    end
    
  it "can update a contestant" do
    visit "/contestants/#{@contestant1.id}/edit"
    
    fill_in("Name", with: "Bolivia")
    select('True', from: "Has representative")
    fill_in("Years of experience", with: "6")
    
    click_button("Update Contestant")
    
    expect(current_path).to eq("/contestants/#{@contestant1.id}")
    expect(page).to have_content("Bolivia")
    expect(page).to have_content("6")
  end
 end
end