class PersonalDetail < ActiveRecord::Base
	belongs_to :employee_detail
	validates :father_name,:presence => true
	validates :mother_name,:presence => true
	validates :personalmail_id, :presence => true, :uniqueness => true
	validates :local_address, :presence => true
	validates :permanent_address, :presence => true
	validates :emergency_contact, :presence => true, :numericality => true, :length => 5..32
	validates :blood_group,:presence => true
	#scope :by_bday_month,where('extract(day  from p_dob) = ? AND extract(month  from p_dob) = ?', (Date.today+3.days).day,Date.today.month)
	#	scope :by_bday_today_month, where('extract(day  from p_dob) = ? AND extract(month  from p_dob) = ?', Date.today.day,Date.today.month)
	#	scope :by_bday_tomorrow_month, where('extract(day  from p_dob) = ? AND extract(month  from p_dob) = ?', Date.today.day+1,Date.today.month)
	#	scope :by_bday_yesterday_month, where('extract(day  from p_dob) = ? AND extract(month  from p_dob) = ?', Date.today.day-1,Date.today.month)

	scope :by_anniversary_today_day_month, where('extract(day  from anniversary_date) = ? AND extract(month  from anniversary_date) = ?', Date.today.day,Date.today.month)

	scope :by_anniversary_tommorow_day_month, where('extract(day  from anniversary_date) = ? AND extract(month  from anniversary_date) = ?', Date.today.day+1,Date.today.month)
	scope :by_anniversary_yesterday_day_month, where('extract(day  from anniversary_date) = ? AND extract(month  from anniversary_date) = ?', Date.today.day-1,Date.today.month)
end
