class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :degree
      t.string :college
      t.string :location
      t.string :yop
      t.float :gpa

      t.timestamps null: false
    end
  end
end
