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

    #User Story 6, Parent Index sorted by Most Recently Created 
    it 'can see see that records are ordered by most recently created first
    And next to each of the records I see when it was created' do
      visit "/pageants"

      expect(@pageant2.name).to appear_before(@pageant1.name)
    end

    it 'next to each of the records can see when it was created' do
      visit "/pageants"

      expect(page).to have_content(@pageant1.created_at)
      expect(page).to have_content(@pageant2.created_at)
    end

    # User Story 11, Pageant Creation 
    it 'shows a link to create a new Pageant record' do
      visit "/pageants"

      expect(page).to have_link(href: "/pageants/new")
    end

    it "links to the new page from the pageants index" do
      visit "/pageants"
      click_link("New Pageant")
      
      expect(current_path).to eq("/pageants/new")
    end

    # User Story 17, Parent Update From Parent Index Page 
    it "shows link to edit Pageant" do
      visit "/pageants"

      expect(page).to have_link("Edit Pageant #{@pageant1.name}", href: "/pageants/#{@pageant1.id}/edit")
      expect(page).to have_link("Edit Pageant #{@pageant2.name}", href: "/pageants/#{@pageant2.id}/edit")
    end

    it "takes me to that Pageant edit page where I can update its information just like in User Story 12" do
      visit "/pageants"
      click_link("Edit Pageant #{@pageant1.name}", match: :first)
      
      expect(current_path).to eq("/pageants/#{@pageant1.id}/edit")
    end

    #User Story 22, Parent Delete
    it "shows a link to delete the parent" do
      visit "/pageants"

      expect(page).to have_button("Delete")
    end
  end
end