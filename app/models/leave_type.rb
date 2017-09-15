class   LeaveType < ActiveRecord::Base
  belongs_to :leave_record
  #belongs_to :leave_detail
  has_many :leave_details
end



