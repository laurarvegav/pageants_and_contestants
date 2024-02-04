require 'rails_helper'

RSpec.describe 'Pageant Show', type: :feature do
  describe 'As a visitor' do
    before(:each) do
      @pageant1 = Pageant.create!(name: "Miss Colombia", scheduled: true, version_number: 10)
      @pageant2 = Pageant.create!(name: "Miss Universe", scheduled: true, version_number: 25)
      @contestant1 = @pageant2.contestants.create!(name: "Colombia", years_of_experience: 57, has_representative: true)
      @contestant2 = @pageant2.contestants.create!(name: "Peru", years_of_experience: 75, has_representative: true)
    end

    # User Story 2, Parent Show 
    it 'can see the pageant and all its attributes' do
      visit "/pageants/#{@pageant1.id}"
      
      expect(page).to have_content(@pageant1.name)
      expect(page).to have_content(@pageant1.scheduled)
      expect(page).to have_content(@pageant1.version_number)
    end

    # User Story 7, Parent Child Count
    it 'can show the count of the number of contestants associated with this pageant' do
      visit "/pageants/#{@pageant2.id}"

      expected_text = "#{@pageant2.name} has #{@pageant2.contestants.count} contestants."
      expect(page).to have_content(expected_text.strip)
    end

    # User Story 9, Parent Index Link
    it "shows a link at the top of the page that takes me to the Pageant Index" do
      visit "/pageants/#{@pageant2.id}"

      expect(page).to have_link(href: "/pageants")
    end

    # User Story 10, Parent Child Index Link
    it "shows a link to take me to that pageant's contest page" do
      visit "/pageants/#{@pageant2.id}"

      expect(page).to have_link(href: "/pageants/#{@pageant2.id}/contest")
    end

    # User story 12, Parent Update
    it "shows a link to update the parent 'Update Pageant'" do
      visit "/pageants/#{@pageant1.id}"

      expect(page).to have_link(href: "/pageants/#{@pageant1.id}/edit")
    end

    xit "takes you to the form to 'Update Pageant'" do
      visit "/pageants/#{@pageant1.id}"
      click_button("Update Pageant")

      expect(current_path).to eq("/pageants/#{@pageant1.id}/edit")
    end
 end
end