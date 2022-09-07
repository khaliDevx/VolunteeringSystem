class EmployeesController < ApplicationController
  layout 'application'
  before_action :check_login
  before_action :set_bass ,only: [:bass]
  before_action :check_type
  # before_action :set_user ,only: [:edit]
  # before_action :confirm_employee_type, except: [:new, :create]

  def user
    @user = User.where(:id=>session[:user_id]) 
    @users=User.volunteer.where(["first_name LIKE ?","%#{params[:first_name]}%"])

  end
  def block 
    
    if User.where(:id=>update_params[:id]).update_all(:accountstatu=>false)
      redirect_to "/user"
    else
      flash[:error_blook]="something went wrong"
      redirect_to "/user"

    end
  end
  def active
    # @user=User.find_by(id: active_params[:id])
    # @user.accountstatu=true
    if User.where(:id=>active_params[:id]).update_all(:accountstatu=>true)
      redirect_to "/user"
    else
      flash[:error_active]="something went wrong"
      redirect_to "/user"
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
