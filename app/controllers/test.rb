def create

  if params[:employee_detail][:id].to_i==session[:emp_id]
    @employ=EmployeeDetail.find(session[:emp_id])
    if not @employ.manager_mailid.blank?
      # @leave_detail=LeaveDetail.find_by_employee_detail_id_and_leave_type_id_and_year(session[:emp_id],params[:leave_record][:leave_type_id],params[:leave_record][:from_date].to_i)
      # if @leave_detail.balance >= params[:leave_record][:no_of_days].to_f and not params[:leave_record][:no_of_days].to_f==0

      if params[:leave_record][:from_date].to_i == params[:leave_record][:to_date].to_i
        @leave_record= LeaveRecord.new(params[:leave_record])
        @leave_record.employee_detail_id=session[:emp_id]
        @leave_record.year=params[:leave_record][:from_date].to_i
        if params[:leave_record][:leave_type_id] == "8"
          if !(params[:leave_record][:no_of_days].to_f > 1)
            FESTIVAL << @employ.personal_detail.anniversary_date.strftime("-%m-%d").prepend(Date.today.strftime("%Y")) if !@employ.personal_detail.blank? and !@employ.personal_detail.anniversary_date.blank?
            FESTIVAL<< @employ.dob.strftime("%Y-%m-%d").to_s.from(4).to(9).prepend(Date.today.strftime("%Y"))  if !@employ.blank? and !@employ.dob.blank?
            if FESTIVAL.include? params[:leave_record][:from_date]

#@leave_detail=LeaveDetail.find_by_employee_detail_id_and_leave_type_id_and_year(params[:employee_detail][:id],params[:leave_record][:leave_type_id],params[:leave_record][:from_date].to_i)
# compare=EmployeeDetail.find_by_id(session[:emp_id])


# a.balance >= params[:leave_record][:no_of_days].to_f

# compare.leave_details.where("leave_type_id=?",8).total_leaves >= compare.balance >= params[:leave_record][:no_of_days].to_f


              @leave_detail=EmployeeDetail.find(session[:emp_id]).leave_details.where("leave_type_id=? and year =? ",params[:leave_record][:leave_type_id],params[:leave_record][:from_date].to_i).last
              #@leave_detail=LeaveDetail.find_by_employee_detail_id_and_leave_type_id_and_year(params[:employee_detail][:id],params[:leave_record][:leave_type_id],params[:leave_record][:from_date].to_i)
              @leave_detail.balance=@leave_detail.balance-params[:leave_record][:no_of_days].to_f
              @leave_detail.availed=@leave_detail.availed+params[:leave_record][:no_of_days].to_f

              # if @leave_detail.balance <=  @leave_detail.leave_type.total_leaves
              a=EmployeeDetail.find(session[:emp_id]).leave_details.where("leave_type_id=?",params[:leave_record][:leave_type_id]).last
              if a.balance >= params[:leave_record][:no_of_days].to_f
                @leave_record.save
                @leave_detail.save
                # LeaveMailer.apply_email(@leave_record).deliver
                flash[:notice]='Optional Leave applied successfully'
                redirect_to :controller =>'select',:action => 'list'
              else
                flash[:notice]='You dont have optional_leaves'
                render :controller => 'select',:action => 'apply'
              end
            else
              flash[:notice]='This is not an optional leave'
              render :controller => 'select',:action => 'apply'
            end
          else
            flash[:notice]='Please apply optional leave individually for each day'
            render :controller => 'select',:action => 'apply'

          end
        else
          if @leave_record.save
            #LeaveMailer.apply_email(@leave_record).deliver
            flash[:notice]='Leave applied successfully'

            #this code will deduct employee leaves on the time of apply itself
            @leave_detail=LeaveDetail.find_by_employee_detail_id_and_leave_type_id_and_year(params[:employee_detail][:id],params[:leave_record][:leave_type_id],params[:leave_record][:from_date].to_i)
            @leave_detail.balance=@leave_detail.balance-params[:leave_record][:no_of_days].to_f
            @leave_detail.availed=@leave_detail.availed+params[:leave_record][:no_of_days].to_f
            @leave_detail.save

            redirect_to :controller =>'select',:action => 'list'
          else
            render :controller => 'select',:action => 'apply'
          end
        end
      else
        flash[:notice]='Please apply individual leave for Next year'
        redirect_to :back
      end

      # else
      #   @leave_record= LeaveRecord.new(params[:leave_record])
      #   flash[:notice]='No Leaves Available'
      #   render :controller => 'select',:action => 'apply'
      # end
    else
      @leave_record= LeaveRecord.new(params[:leave_record])
      flash[:notice]='Please fill your TL mailid in employee profile'
      render :back
    end
  else
    render :text=>"Its wrong url",:layout=>true
  end
end
