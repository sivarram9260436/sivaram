class AddAadharNumberToEmployeeDetail < ActiveRecord::Migration
  def change
    add_column :employee_details, :aadhar_number, :string
  end
end
