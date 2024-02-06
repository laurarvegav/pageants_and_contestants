require 'rails_helper'

RSpec.describe 'Pageant Show', type: :feature do
  describe 'As a visitor' do
    before(:each) do
      @pageant1 = Pageant.create!(name: "Miss Colombia", scheduled: true, version_number: 10)
      @pageant2 = Pageant.create!(name: "Miss Universe", scheduled: true, version_number: 25)
      @contestant1 = @pageant2.contestants.create!(name: "Colombia", years_of_experience: 57, has_representative: true)
      @contestant2 = @pageant2.contestants.create!(name: "Peru", years_of_experience: 75, has_representative: true)
    end

    # User Story 13, Parent Child Creation 
    it "shows a form to add a new adoptable contestant for that pageant 'Create Contestant'" do
      visit "/pageants/#{@pageant1.id}/contestants/new"

      expect(page).to have_content("Register a Contestant")
      expect(page).to have_field("Name")
      expect(page).to have_field("Years of experience")
      expect(page).to have_field("Has representative")
      expect(page).to have_button("Register Contestant")
    end
    
    it "can register a contestant in a pageant" do
      visit "/pageants/#{@pageant1.id}/contestants/new"
     
      fill_in("Name", with: "Bolivia")
      select('True', from: "Has representative")
      fill_in("Years of experience", with: "6")
      
      click_button("Register Contestant")
      
      expect(current_path).to eq("/pageants/#{@pageant1.id}/contestants")
      expect(page).to have_content("Bolivia")
      expect(page).to have_content("6")
    end
  end
end