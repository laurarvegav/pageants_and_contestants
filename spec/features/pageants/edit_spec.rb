require 'rails_helper'

RSpec.describe 'Pageants Update', type: :feature do
  describe 'As a visitor' do
    before(:each) do
      @pageant1 = Pageant.create!(name: "Miss Colombia", scheduled: true, version_number: 10)
      @pageant2 = Pageant.create!(name: "Miss Universe", scheduled: true, version_number: 25)
      @contestant1 = @pageant2.contestants.create!(name: "Colombia", years_of_experience: 57, has_representative: true)
      @contestant2 = @pageant2.contestants.create!(name: "Peru", years_of_experience: 75, has_representative: true)
    end
    
    # User Story 12, Pageant Update
    it 'shows a form to edit the pageants attributes' do
      visit "/pageants/#{@pageant1.id}/edit"
        
      expect(page).to have_content("Update the Pageant")
      expect(page).to have_field("Name")
      expect(page).to have_field("Scheduled")
      expect(page).to have_button("Update Pageant")
    end
    
    it "can update a pageant" do
      visit "/pageants/#{@pageant1.id}/edit"
      
      fill_in("Name", with: "Miss Colombia")
      select('False', from: "Scheduled")
      find("#version_number", wait: 10).set("33")
      
      click_button("Update Pageant")
      
      expect(current_path).to eq("/pageants/#{@pageant1.id}")

      expect(page).to have_content("Miss Colombia")
      expect(page).to have_content("False")
      expect(page).to have_content("33")
    end
  end
end