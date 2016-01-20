class AddBasicIdToSkill < ActiveRecord::Migration
  def change
    add_column :skills, :basic_id, :integer
  end
end
