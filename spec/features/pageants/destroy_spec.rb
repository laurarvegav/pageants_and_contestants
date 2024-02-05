require "rails_helper"

RSpec.describe "destroying a Pageant" do
  before do
    @pageant1 = Pageant.create!(name: "Miss Colombia", scheduled: true, version_number: 10)
    @contestant3 = @pageant1.contestants.create!(name: "Huila", years_of_experience: 5, has_representative: true)
    @contestant4 = @pageant1.contestants.create!(name: "Arauca", years_of_experience: 7, has_representative: true)
  end

  #User Story 19, Parent Delete
  it "can delete the pageant from the show page" do
    visit "/pageants/#{@pageant1.id}"
    click_button "Delete"

    expect(current_path).to eq("/pageants")
    expect(page).to_not have_content("Miss Colombia")
  end

  it "can delete the contestants of the pageant from the show page" do
    visit "/pageants/#{@pageant1.id}"

    click_button "Delete"

    visit "/contestants"
    expect(page).to_not have_content("Huila")
    expect(page).to_not have_content("Arauca")
  end
end