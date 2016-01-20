class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :company
      t.string :location
      t.string :duration
      t.string :role
      t.string :description

      t.timestamps null: false
    end
  end
end
