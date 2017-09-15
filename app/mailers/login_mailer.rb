class LoginMailer < ActionMailer::Base
 
 def login_email(employee,random_string,url)
   
   @employee_detail = employee
   @random_string = random_string
   @url = url
   
   @user = @employee_detail.official_mailid
   @off = @employee_detail.office_type.name   
   mail(:from=>"jeganr@kreatio.com",:to =>@user,:subject => "User Details for EDMS & LMS") if @off == "Kreatio"
   mail(:from=>"jeganr@kreatio.com",:to =>@user,:subject => "User Details for EDMS & LMS") if @off == "Webnish"
  
  end

  def password_email(mailid,password,url)
  	@t=mailid
  	@password=password
  	@url=url

    @employee=mailid
    mail(:from=>"jeganr@kreatio.com",:to =>@employee,:subject => "User Details for EDMS & LMS")
  end

  def reset_password_mail(employee,code,url)   
    @employee_detail = employee
    @to=@employee_detail.official_mailid 
    @code=code
    @url=url 
    @off = @employee_detail.office_type.name
    mail(:from=>"jeganr@kreatio.com",:to =>@to,:subject => "Fill Your New Password") if @off == "Kreatio"
    mail(:from=>"jeganr@kreatio.com",:to =>@to,:subject => "Fill Your New Password") if @off == "Webnish"
  end

end
