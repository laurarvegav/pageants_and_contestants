require 'rails_helper'

RSpec.describe 'Pageants Index', type: :feature do
 describe 'As a visitor' do
  before(:each) do
    @pageant1 = Pageant.create!(name: "Miss Colombia", scheduled: true, version_number: 10)
    @pageant2 = Pageant.create!(name: "Miss Universe", scheduled: true, version_number: 25)
  end

  # User Story 1, Parent Index
  it 'can see the name of each pageant record in the system' do
    visit "/pageants"

    expect(page).to have_content(@pageant1.name)
    expect(page).to have_content(@pageant2.name)
  end
 end
end