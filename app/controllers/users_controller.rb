class UsersController < ApplicationController
     layout 'application2'
     before_action :confirm, except: [:new, :create]
    def index 
     @user = User.where(:id=>session[:user_id]) 
     @employee= User.where(:id=>session[:user_id],:user_type=>"Employee")
   
     @problems = Problem.issue_passed.order("id DESC").with_attached_image

    
    end
    def profile
      @employee= User.where(:id=>session[:user_id],:user_type=>"Employee")
      @city= City.all
      @gover= Governorate.all
      @problems=Problem.where(:user_id=> session[:user_id])
      @user = User.where(:id=>session[:user_id]) 
    end
    def update_profile
        user=User.find_by(id: session[:user_id])
        if User.where(:id=> session[:user_id]).update_all(:city_id=>update_profile_params[:city_id])
            redirect_to "/profile"
        else
            redirect_to '/profile'
        end
    end
    def update
        @user=User.find_by(id: update_params[:id])
        if User.where(:id=>update_params[:id]).update_all(:first_name=>update_params[:first_name],:last_name=>update_params[:last_name],:username=>update_params[:username])
            redirect_to "/profile"
        else
            redirect_to '/profile'
        end
    end
    def log_out
        session[:user_id]=nil
        cookies[:user_type]=nil
        redirect_to '/'
        
    end
    def confirmed_issue
     @user = User.where(:id=>session[:user_id]) 
     @employee= User.where(:id=>session[:user_id],:user_type=>"Employee")
     @mat = Material.all
   
    end
    # def accept 
    #     @accept_issue = Accept.new
    #     @billOfMaterial = BillOfMaterial.new
    #     @problems = Problem.issue_passed.with_attached_image
        
    # end
    def accept_status
        @user = User.where(:id=>session[:user_id]) 
        @employee= User.where(:id=>session[:user_id],:user_type=>"Employee")
      
        @problems = Problem.accept_issue.order("id DESC").with_attached_image
    end
    def accept_issue
        
        accept=Accept.new(accept_params)
        # accept.required_volunteer=params[:required_volunteer]
        accept.user_id=session[:user_id]
        accept.problem_id=params[:problem_id]
        if accept.save 
            @billOfMaterial=BillOfMaterial.create({cost:params[:cost],quantity:params[:quantity],material_id:params[:material_id] ,accept_id: session[:user_id]})
            Problem.where(id:params[:problem_id]).update_all(:status=>"Accepted")
            User.where(:id=>session[:user_id]).update_all(:supervisor=>true)
            # .material_id=params[:material_id]
            # @billOfMaterial.save
            redirect_to "/accept"
        else
            redirect_to "/"
        end
    end
    def join
        join=JoinIssue.new(join_params)
        join.user_id=session[:user_id]
        if join.save 
            flash[:success]="you are successfully joined "
            redirect_to '/accept_status'
        else
            flash[:error]="something went wrong"
            redirect_to '/accept_status'
        end
      
    end
    
    
    private
         def set_login
             @user=User.find(params[:id])
         end
         def login_params
            params.require(:user).permit(:first_name, :last_name, :phone, :username, :password, :city_id, :accountstatu)  
         end
         def update_params
            params.require(:edit_user).permit(:id,:first_name, :last_name, :username)  
         end
         def accept_params
            params.require(:accept).permit(:problem_id, :user_id,:required_volunteer ,:start_date ,:totale_cost)
         end
         def update_profile_params
            params.require(:upprofile).permit(:city_id)
         end
         def join_params 
            params.require(:join_issue).permit(:problem_id)
         end
       
        
        
        
end
