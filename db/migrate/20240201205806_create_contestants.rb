class CreateContestants < ActiveRecord::Migration[7.1]
  def change
    create_table :contestants do |t|
      t.string :name
      t.integer :years_of_experience
      t.boolean :has_representative
      t.references :pageant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
