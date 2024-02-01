class AddPageantsToContestants < ActiveRecord::Migration[7.1]
  def change
    add_reference :contestants, :pageant, null: false, foreign_key: true
  end
end
