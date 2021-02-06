class HomeController < ApplicationController

  before_action :authenticate_user!
  
  def index
    if current_user.admin == true 
      redirect_to rails_admin_path
    elsif current_user.role == "teacher"
      redirect_to teachers_path 
    elsif current_user.role == "student"
      redirect_to students_path
    else  
      redirect_to new_user_session_path
    end
    
  end
end
