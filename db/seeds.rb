# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
@pageant1 = Pageant.create!(name: "Miss Colombia", scheduled: true, version_number: 10)
@pageant2 = Pageant.create!(name: "Miss Universe", scheduled: true, version_number: 25)
@pageant3 = Pageant.create!(name: "Miss NRS", scheduled: true, version_number: 9)
@contestant1 = @pageant2.contestants.create!(name: "Colombia", years_of_experience: 57, has_representative: true)
@contestant2 = @pageant2.contestants.create!(name: "Peru", years_of_experience: 75, has_representative: true)
@contestant3 = @pageant3.contestants.create!(name: "Bogota", years_of_experience: 11, has_representative: true)
@contestant4 = @pageant3.contestants.create!(name: "Bolivar", years_of_experience: 7, has_representative: true)