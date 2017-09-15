class EmployeeController < ApplicationController
  require 'digest/md5'
  require 'csv'
  respond_to :html, :json
  before_filter :admin, :except=>[:login,:log,:fill_own_password,:own_password]
  before_filter :authorization, :only=>["display"]
  layout "welcomelayout",:except=>["fill_own_password","own_password"]

  def logout
    session[:emp_id] = nil
    redirect_to :action => "log"
  end

  def contact_us
  end

  def login
    password=params[:employee_detail][:password]
    hash_pass = Digest::MD5.hexdigest(password)
    authent=EmployeeDetail.find_by_official_mailid_and_password(params[:employee_detail][:official_mailid],hash_pass)

    if authent.present? and authent.active=="Active"
      if hash_pass=params[:employee_detail][:password]
        session[:role]=Role.find(authent.role_id).role_name
        session[:emp_id]=authent.id
        redirect_to :controller => "employee", :action => "welcome"
      else
        flash[:notice]="Please check your user name and password"
        render :action => "log",  :layout=>"home"
      end
    else
      flash[:notice]="Please check your user name and password"
      render :action => "log",  :layout=>"home"
    end

  end

  def log
    render :layout=>"home"
  end


  def update_tl_email_for_employee

    emp=EmployeeDetail.find_by_id(params[:emp_id])
    emp.update_attributes(:manager_mailid => params[:mail_id])
    render :text => "Tl mail Id changed successfully"
  end

  def index
    @profile=EmployeeDetail.find(session[:emp_id])

  end

  def new
    @employee_detail = EmployeeDetail.find(session[:emp_id])
    if @employee_detail.personal_detail.present?
      @personal_detail = @employee_detail.personal_detail
    else
      @employee_detail.build_personal_detail
    end

  end


  def create
    @employee_detail = EmployeeDetail.find(session[:emp_id])
    if @employee_detail.update_attributes(params[:employee_detail])
      if params[:employee_detail][:title]=="Mr"

        leave_type_id=LeaveType.where("leave_types =?","Maternity").first.id

        @leave_detail=LeaveDetail.where("employee_detail_id =? and leave_type_id =?",@employee_detail.id,leave_type_id).first
      else
        leave_type_id=LeaveType.where("leave_types =?","Paternity").first.id
        @leave_detail=LeaveDetail.where("employee_detail_id =? and leave_type_id =?",@employee_detail.id,leave_type_id).first
      end

      @leave_detail.balance=0
      @leave_detail.save
      redirect_to :action => "index"
    else
      render :new
    end
  end

  def welcome
    @employee = EmployeeDetail.find(session[:emp_id])
    @employee_detail = EmployeeDetail.find(session[:emp_id]).emp_name
    @birth_today = EmployeeDetail.by_bday_today_month
    @birth_tomorrow = EmployeeDetail.by_bday_tomorrow_month
    @birth_yesterday = EmployeeDetail.by_bday_yesterday_month
    @annivers_today = PersonalDetail.by_anniversary_today_day_month
    @annivers_tomorrow = PersonalDetail.by_anniversary_tommorow_day_month
    @annivers_yesterday = PersonalDetail.by_anniversary_yesterday_day_month
  end


  def edit
    @employee_detail = EmployeeDetail.find(params[:id])
  end

  def update
    @employee_detail = EmployeeDetail.find(params[:id])
    if @employee_detail.update_attributes(params[:employee_detail])
      redirect_to :action => "index"
    else
      render :edit
    end
  end

  def change_password

  end

  def update_password
    @employee_detail=EmployeeDetail.find(session[:emp_id])
    password=@employee_detail.password
    old_password=params[:employee_detail][:old_password]
    hash_oldpass = Digest::MD5.hexdigest(old_password)
    new_password=params[:employee_detail][:password]
    hash_newpass=Digest::MD5.hexdigest(new_password)
    confirm_password=params[:employee_detail][:confirm_password]
    hash_password = Digest::MD5.hexdigest(confirm_password)

    if password==hash_oldpass
      if hash_newpass==hash_password
        if not params[:employee_detail][:password].blank?
          @employee_detail.password=hash_password
          @employee_detail.save(:validate => false)
          flash[:notice] ="your password changed successfully"
          render :action=>"change_password"
        else
          flash[:notice]="PASSWORD FIELD IS EMPTY"
          render :action=>"change_password"
        end
      else
        flash[:notice]="New Password and Confirm password does not match"
        render :action=>"change_password"
      end

    else
      flash[:notice]="You have entered incorrect old password"
      render :action=>"change_password"
    end
  end

  def fill_own_password
    render :layout => 'forgot_password'
  end

  def own_password
    if not params[:employee_detail][:reset_password_code].blank?
      @employee_detail=EmployeeDetail.find_by_reset_password_code(params[:employee_detail][:reset_password_code])
      if not @employee_detail== nil and @employee_detail.active_resetcode=='true'
        new_password=params[:employee_detail][:password]
        hash_newpass=Digest::MD5.hexdigest(new_password)
        confirm_password=params[:employee_detail][:confirm_password]
        hash_password = Digest::MD5.hexdigest(confirm_password)

        if hash_newpass==hash_password
          if not params[:employee_detail][:password].blank?
            @employee_detail.password=hash_password
            @employee_detail.active_resetcode='false'
            @employee_detail.save(:validate => false)
            @employee_detail.reset_password_code = nil
            flash[:notice] ="your password changed successfully"
            redirect_to root_url
          else
            flash[:notice]="PASSWORD FIELD IS EMPTY"
            render :fill_own_password,:layout => 'forgot_password'
          end
        else
          flash[:notice]="New Password and Confirm password does not match"
          render :fill_own_password,:layout => 'forgot_password'
        end
      else
        flash[:notice]="Enter correct Password code"
        render :action=>"fill_own_password",:layout=>"forgot_password"
      end
    else
      flash[:notice]="Enter password code"
      render  :fill_own_password,:layout => 'forgot_password'
    end
  end

  def display
    @profiles=EmployeeDetail.where("active =?","Active").order("emp_name asc")
  end

  def destroy
  end

  def show
    @profile=EmployeeDetail.find(params[:employee_detail_id])
  end

  def view_others_profile
    @slno =0;
    @others_profile=EmployeeDetail.where("active =?","Active").order("emp_name asc")
  end

  def document
  end

  def upload_document
    @document=Document.new(params[:document])
    if @document.save
      flash[:notice]='Document uploaded successfully'
    end
  end

  def forgotten_passsword
  end

  def deactivate_users
    @others_profile=EmployeeDetail.order("active asc")
  end

  def deactivation
    params[:employee][:active] .each do |emp|
      @emp_id=EmployeeDetail.where(:id=>emp).first
      @emp_id.send(params[:select_deactivate])
    end
    redirect_to :action=>"deactivate_users"
  end

  def export_user_data
    EmployeeDetail.export_user_data
    redirect_to "/employee_data.csv"
  end

  def leave_list_export
  end

  def individual_leave_export
    EmployeeDetail.export_individual_leave(params[:emp_id])
    redirect_to "/employee_leave_list.csv"
  end

  def date_list
    @employee = EmployeeDetail.by_active.by_mailid
  end

  def fill_mail
  end


  def change_role
    a = EmployeeDetail.find_by_id(session[:emp_id])
    @employee_list= EmployeeDetail.where("active =? and role_id IN (?) and office_type_id =?","Active",[1,3],a.office_type_id).order("emp_name asc")

    @employee_change_role=Role.all

  end
  def change_role_for_all_employee
    #params=[:employee_detail]
    logger.info"==========#{params.inspect}"
    @employee_detail=EmployeeDetail.find(params[:employee_detail][:id])
    @employee_detail.update_attributes(:role_id => params[:role][:id])
    flash[:notice]="Role changed Successfully"
    redirect_to :action => "change_role"

  end


  def export_leave_of_all_users
    EmployeeDetail.export_individual_leave(params[:emp_id])
    redirect_to "/leave_of_all_users.csv"
  end

  def get_leave_balance
    a = EmployeeDetail.find_by_id(session[:emp_id])
    employee_list=EmployeeDetail.where("active =? and office_type_id =?","Active",a.office_type_id).order("emp_name asc")
    EmployeeDetail.export_leave_of_all_users(employee_list)
    redirect_to "/leave_balance_for_users.csv"
  end

  def leave_balance_of_all_employee

    #@leave_detail= LeaveDetail.where("employee_detail_id IN (?) AND year =? ",employee_list.map(&:id),Time.now.year)
  end



  def add_leaves
    @emp = EmployeeDetail.where(official_mailid:params[:official_mailid].strip).first
    if !@emp.blank? && !params[:days].blank?
      @comp = @emp.leave_details.by_balance(LeaveType.where(leave_types:"Comp Off").first.id,@emp.id).first
      days = params[:days].to_f
      @comp.update_attributes(:total_leaves=>@comp.total_leaves+days, balance:@comp.balance+days, total_leave_balance:@comp.total_leave_balance+days)
      ApprovedMailer.added_leaves(@emp,days).deliver
      redirect_to "/select/employee_new_leave_balance?employee_detail_id=#{@emp.id}"
    else
      flash[:notice] = "Please enter correct mailid"
      flash[:notice] = "Please Enter No of Days" if params[:days].blank?
      redirect_to :back
    end

  end


end
