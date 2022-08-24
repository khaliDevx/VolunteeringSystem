class EmployeesController < ApplicationController
  layout 'application2'
  
  before_action :set_bass ,only: [:bass]
  # before_action :set_user ,only: [:edit]
  # before_action :confirm_employee_type, except: [:new, :create]

  def index
    @user = User.where(:id=>session[:user_id]) 
    @users=User.volunteer.where(["first_name LIKE ?","%#{params[:first_name]}%"])

  end
  
  # def new 
    
  # end
  # def create 
  #   user=User.new(login_params)
  #   user.user_type="Volunteer"
  #   user.employee_id=session[:user_id]
  #       if user.save
  #           # cookies[:user_type]=user.user_type
  #           # session[:user_id]=user.id
  #           redirect_to '/users'
  #       else
  #           flash[:error]=user.errors.full_messages
  #           redirect_to '/new_user'
  #       end
  # end
  def block 
    @user=User.find_by(id: update_params[:id])
    @user.accountstatu=false
    if @user.update(update_params)
      # redirect_to "/users"
    end
  end
  def active
    @user=User.find_by(id: active_params[:id])
    @user.accountstatu=true
    if @user.update(active_params)
      # redirect_to "/users"
    end
  end

  def pass
    # @problem = Problem.where(params[:id])
    # @problem = Problem.find_by(id: pass_params[:id])
    # @problem.status="Passed"
    if Problem.where(id:pass_params[:id]).update_all(:status=>"Passed")
      redirect_to '/issue'
    else
      redirect_to "/issue"
    end

  end
  def issue
    @user = User.where(:id=>session[:user_id]) 
    @problems = Problem.order("id DESC").issue_submitted.with_attached_image
  end
  def confirm
    # problem=Problem.find_by(id: confirm_params[:id])
    Problem.where(id:confirm_params[:id]).update_all(:status=>"Confirmed")
    redirect_to '/index'
    # problem.status="Confirmed"
    # problem.update(confirm_params)
  end
  def report
    # @problems = Problem.with_attached_image.where(:status=>params[:status])
    # render 'reports'
  end
  def about

  end
  private

    def set_pass
     @problem = Problem.find(params[:id])
    end
     def set_user
      @user = User.find(params[:id])
     end
     def problem_params
      params.require(:problem).permit(:image, :cordinates,  :status, :desciption, :governorate_id, :category_id,:city_id,:user_id)  
     end
     def update_params
      params.require(:block).permit(:accountstatu,:id)  

     end
     def active_params
      params.require(:active).permit(:accountstatu,:id)  

     end
     def pass_params
      params.require(:pass).permit(:status,:id)  
     end
     def confirm_params
      params.require(:confirm_issue).permit(:status,:id)  
     end
    #  def select_params
    #   params.require(:select).permit(:status)  
    #  end
     
  
end