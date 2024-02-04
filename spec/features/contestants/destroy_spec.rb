require "rails_helper"

RSpec.describe "destroying a Contestamt" do
  before do
    @pageant1 = Pageant.create!(name: "Miss Colombia", scheduled: true, version_number: 10)
    @contestant3 = @pageant1.contestants.create!(name: "Huila", years_of_experience: 5, has_representative: true)
    @contestant4 = @pageant1.contestants.create!(name: "Arauca", years_of_experience: 7, has_representative: true)
  end
  it "can delete the contestant from the show page" do
    visit "/contestants/#{@contestant3.id}"

    click_button "Delete"

    expect(current_path).to eq("/contestants")
    expect(page).to_not have_content("Huila")
  end
end