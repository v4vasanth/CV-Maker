class AddApplicantIdToPen < ActiveRecord::Migration
  def change
    add_column :pens, :applicant_id, :integer
  end
end
