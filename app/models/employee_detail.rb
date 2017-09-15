class EmployeeDetail < ActiveRecord::Base
  has_one :personal_detail
  has_one :role
  belongs_to :office_type


  accepts_nested_attributes_for :personal_detail

  has_many :leave_records
  has_many :leave_details

  validates :emp_name, :presence => true
  validates :dob, :presence => true

  validates :contact_no, :presence => true, :numericality => true, :length => 6..32
  validates :manager_mailid, :presence => true
  validates :official_mailid, :presence => true, :uniqueness => true


  scope :children, lambda{|email| {:conditions=>["manager_mailid ILIKE ? and active =?",email,"Active"]}}
  scope :by_active, where(:active => "Active")
  scope :by_mailid, order("official_mailid asc")
  scope :by_bday_today_month, where('extract(day  from dob) = ? AND extract(month  from dob) = ? AND active =?' , Date.today.day,Date.today.month,"Active")
  scope :by_bday_tomorrow_month, where('extract(day  from dob) = ? AND extract(month  from dob) = ? AND active =?', Date.today.day+1,Date.today.month,"Active")
  scope :by_bday_yesterday_month, where('extract(day  from dob) = ? AND extract(month  from dob) = ?', Date.today.day-1,Date.today.month)

  def deactivate
    self.active="Deactivated"
    self.save(:validate=>false)
  end

  def self.export_user_data
    CSV.open("#{Rails.root}/public/employee_data.csv", "w") do |csv|
      csv << ["MailID", "Employee ID","FirstName", "MiddleName", "LastName", "Gender","Date Of Join","Certificate DOB", "Actual DOB", "Martial Status", "Contact number", "Office Contact Number", "Pan Number", "PF Number","PF UAN Number", "TL MailID", "Manager MailID", "Father Name", "Mother Name", "Blood Group", "Personal Mail ID", "Anniversary Date", "Local Address", "Permanent Address", "Emergency Person", "Relationship", "Emergency Number", "Emergency Contact"]
      @users = EmployeeDetail.where("active = ?", "Active").order("official_mailid asc").each do |emp|
        csv << ["#{emp['official_mailid']}",
                "#{emp['empl_id']}",
                "#{emp['emp_name']}",
                "#{emp['middle_name']}",
                "#{emp['last_name']}",
                "#{emp['gender']}",
                "#{emp['date_of_join']}",
                "#{emp['dob']}",
                "#{emp.personal_detail.p_dob if emp.personal_detail}",
                "#{emp['martial_status']}",
                "#{emp['contact_no']}",
                "#{emp['office_contact_no']}",
                "#{emp['pan_number']}",
                "#{emp['pf_number']}",
                "#{emp['pf_uan_no']}",
                "#{emp['manager_mailid']}",
                "#{emp['tl_mailid']}",
                "#{emp.personal_detail.father_name if emp.personal_detail}",
                "#{emp.personal_detail.mother_name if emp.personal_detail}",
                "#{emp.personal_detail.blood_group if emp.personal_detail}",
                "#{emp.personal_detail.personalmail_id if emp.personal_detail}",
                "#{emp.personal_detail.anniversary_date if emp.personal_detail}",
                "#{emp.personal_detail.local_address if emp.personal_detail}",
                "#{emp.personal_detail.permanent_address if emp.personal_detail}",
                "#{emp.personal_detail.guardian if emp.personal_detail}",
                "#{emp.personal_detail.relationship if emp.personal_detail}",
                "#{emp.personal_detail.emergency_contact if emp.personal_detail}"]
      end
    end
  end

  def self.export_individual_leave(emp_id)
    @leave_records = LeaveRecord.where("employee_detail_id = ? AND year = ? AND status != ?", emp_id, Time.now.year, "cancelled").order("from_date asc")
    CSV.open("#{Rails.root}/public/employee_leave_list.csv", "w") do |csv|
      csv << ["From Date", "To Date", "No Of Days", "Leave Type", "Status", "Reason"]
      @leave_records.each do |emp_leave|
        leave_type = LeaveType.find(emp_leave.leave_type_id).leave_types
        csv << [emp_leave.from_date,emp_leave.to_date,emp_leave.no_of_days,leave_type,emp_leave.status,emp_leave.reason]
      end
    end
  end







  def self.export_leave_of_all_users(emp_list)

    CSV.open("#{Rails.root}/public/leave_balance_for_users.csv", "w") do |csv|

      #csv << ["EmployeeName","LeaveType","TotalLeaves","TotalLeaveBalance","Availed","balance"]

      # csv << ["From Date", "To Date", "No Of Days", "Leave Type", "Status", "Reason"]
      emp_list.each do |emp|
        #  leave_detail = LeaveDetail.where("employee_detail_id = ? AND year =?",emp,Time.now.year)
        leave_detail = LeaveDetail.where("employee_detail_id = ? AND year =? AND created_at < ? " ,emp,Time.now.year,"2017-03-31 21:32:09")

        csv << ["#{emp.emp_name}#{emp.last_name}","Total Leaves","Eligible Leaves","Availed","Available Balance"]
        leave_detail.each do |emp_leave|
          csv << [
              "#{emp_leave.leave_type.leave_types}",
              "#{emp_leave.total_leaves}",
              "#{emp_leave.total_leave_balance}",
              "#{emp_leave.availed}",
              "#{emp_leave.balance}"]
        end
      end
    end
  end
end
