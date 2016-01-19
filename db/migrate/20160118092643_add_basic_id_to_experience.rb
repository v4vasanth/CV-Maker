class AddBasicIdToExperience < ActiveRecord::Migration
  def change
    add_column :experiences, :basic_id, :integer
  end
end
