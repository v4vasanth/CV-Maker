class CreatePens < ActiveRecord::Migration
  def change
    create_table :pens do |t|
      t.string :name
      t.string :color

      t.timestamps null: false
    end
  end
end
