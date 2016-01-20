class AddBasicIdToProject < ActiveRecord::Migration
  def change
    add_column :projects, :basic_id, :integer
  end
end
