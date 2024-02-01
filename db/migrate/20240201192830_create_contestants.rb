class CreateContestants < ActiveRecord::Migration[7.1]
  def change
    create_table :contestants do |t|
      t.integer :pageant_id
      t.string :name
      t.integer :years_of_experience
      t.boolean :has_representative

      t.timestamps
    end
  end
end
