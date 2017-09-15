class ApplicationController < ActionController::Base
     layout "welcomelayout" 
     protect_from_forgery
  def admin
      unless session[:emp_id]
        flash[:notice] = "You must be logged in"
        redirect_to :controller => "employee",:action => "log"
      else
        emp = EmployeeDetail.find_by_id(session[:emp_id])
        @user = emp if !emp.blank?
      end   
     end 

  def authorization
  	if not session[:role]=="HR"
  	   render :template=>"select/error_page",:layout=>"welcomelayout"
    else
      emp = EmployeeDetail.find_by_id(session[:emp_id])
      @user = emp if !emp.blank?
    end
  end   
  
 end
