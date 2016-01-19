class AddBasicIdToEducation < ActiveRecord::Migration
  def change
    add_column :educations, :basic_id, :integer
  end
end
