class CreatePageants < ActiveRecord::Migration[7.1]
  def change
    create_table :pageants do |t|
      t.string :name
      t.boolean :scheduled
      t.integer :version_number

      t.timestamps
    end
  end
end
