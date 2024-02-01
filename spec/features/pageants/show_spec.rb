require 'rails_helper'

RSpec.describe 'Pageant Show', type: :feature do
  describe 'As a visitor' do
    before(:each) do
      @pageant1 = Pageant.create!(name: "Miss Colombia", scheduled: true, version_number: 10)
      @pageant2 = Pageant.create!(name: "Miss Universe", scheduled: true, version_number: 25)
    end

    # User Story 2, Parent Show 
    it 'can see the pageant and all its attributes' do
      visit "/pageants/#{@pageant1.id}"
      
      expect(page).to have_content(@pageant1.name)
      expect(page).to have_content(@pageant1.scheduled)
      expect(page).to have_content(@pageant1.version_number)
    end
 end
end