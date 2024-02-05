require 'rails_helper'

RSpec.describe 'Pageants Contest', type: :feature do
 describe 'As a visitor' do
  before do
    @pageant1 = Pageant.create!(name: "Miss Colombia", scheduled: true, version_number: 10)
    @pageant2 = Pageant.create!(name: "Miss Universe", scheduled: true, version_number: 25)
    @pageant3 = Pageant.create!(name: "Miss NRS", scheduled: true, version_number: 9)
    @contestant1 = @pageant2.contestants.create!(name: "Colombia", years_of_experience: 57, has_representative: true)
    @contestant2 = @pageant2.contestants.create!(name: "Peru", years_of_experience: 75, has_representative: true)
    @contestant3 = @pageant3.contestants.create!(name: "Bogota", years_of_experience: 11, has_representative: true)
    @contestant4 = @pageant3.contestants.create!(name: "Bolivar", years_of_experience: 7, has_representative: true)
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


  # User Story 16, Sort Parent's Children in Alphabetical Order by name 
  it "takes me back to the Contest Page where I see all of the Pageant's Contestants in alphabetical order" do
    visit "/pageants/#{@pageant2.id}/contest"
    click_link("Sort in Alphabetical Order")

    expect(current_path).to eq("/pageants/#{@pageant2.id}/contest")
    expect(@contestant1.name).to appear_before(@contestant2.name)
  end

  # User Story 21, Display Records Over a Given Threshold 
  it "shows a form that allows me to input a number value and a submit button" do
    visit "/pageants/#{@pageant3.id}/contest"

    expect(page).to have_field("Show contestants with more than", type: "number")
    expect(page).to have_button("Years of Experience")
  end

  it "brings me back to the current index page with only the records that meet that threshold shown." do
    visit "/pageants/#{@pageant3.id}/contest"

    fill_in("Show contestants with more than", with: "10")
    click_button("Years of Experience")
  
    expect(current_path).to eq("/pageants/#{@pageant3.id}/contest")

    expect(page).to have_content("Bogota")
    expect(page).to have_no_content("Bolivar")
  end
 end
end