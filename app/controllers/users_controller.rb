class UsersController < ApplicationController
     layout 'application'
    #  before_action :confirm, except: [:new, :create]
    def index 
     @user = User.where(:id=>session[:user_id]) 
     @employee= User.where(:id=>session[:user_id],:user_type=>"Employee")
     @problems = Problem.issue_passed.order("id DESC").with_attached_image
     @issue=Problem.where(:id=>params[:problem_id])

    end
    def profile
      
      @employee= User.where(:id=>session[:user_id],:user_type=>"Employee")
      @city= City.all
      @gover= Governorate.all
      @problems=Problem.where(:user_id=> session[:user_id])
      @user = User.where(:id=>session[:user_id]) 
      @photo = Photo.find_by(user_id: session[:user_id])
      
    end
    def upimage 
       if User.where(:id=>session[:user_id]).save(:image=>image_params[:image])
        redirect_to "/profile"
       else
        redirect_to '/index'
       end
    end
    def update_profile
        user=User.find_by(id: session[:user_id])
        if User.where(:id=> session[:user_id]).update_all(:city_id=>update_profile_params[:city_id])
            redirect_to "/profile"
        else
            flash[:error_city]="something went wrong"
            redirect_to '/profile'
        end
    end
    def update
        @user=User.find_by(id: update_params[:id])
        if User.where(:id=>update_params[:id]).update_all(:first_name=>update_params[:first_name],:last_name=>update_params[:last_name],:username=>update_params[:username],:phone=>update_params[:phone],:bio=>params[:bio])
            redirect_to "/profile"
        else
            flash[:error_profile]="something went wrong"

            redirect_to '/profile'
        end
    end
    def destroy
        user=User.find_by(id:params[:id])
        if user.destroy
            redirect_to '/user'
        else
            flash[:user_error]="something went wrong"
            redirect_to '/user'
        end

    end
    def log_out
       
        session[:user_id]=nil
        cookies[:user_type]=nil
        
        redirect_to '/'
        
    end
    def log
        user = User.find_by(id: session[:user_id])
        if user.user_type=="Employee"
            redirect_to '/issue'
        else
            redirect_to '/index'
        end

        # @comment=Coment.where(:problem_id=>92).count
        # redirect_to'/index'
    end
    
    def confirmed_issue
     @user = User.where(:id=>session[:user_id]) 
     @employee= User.where(:id=>session[:user_id],:user_type=>"Employee")
     @mat = Material.all
   
    end
    def accept_status
        @user = User.where(:id=>session[:user_id]) 
        @problems = Problem.accept_issue.order("id DESC").with_attached_image
    end
    def accept_issue
        accept=Accept.new(accept_params)
        accept.user_id=session[:user_id]
        accept.problem_id=params[:problem_id]
        if accept.save 
            @billOfMaterial=BillOfMaterial.create({cost:params[:cost],quantity:params[:quantity],material_id:params[:material_id] ,accept_id: session[:user_id]})
            Problem.where(id:params[:problem_id]).update_all(:status=>"Accepted")
            User.where(:id=>session[:user_id]).update_all(:supervisor=>true)
            redirect_to "/accept_issue"
        else
            flash[:error_accept]="something went wrong"
            redirect_to "/accept_issue"
        end
    end
    def join
        join=JoinIssue.new(join_params)
        join.user_id=session[:user_id]
        if join.save 
            flash[:success]="you are successfully joined "
            redirect_to '/accept_status'
        else
            flash[:error_join]="something went wrong"
            redirect_to '/accept_status'
        end
      
    end
    def meassage
        
    end
    def personal_page
        @users= User.where(:id=>params[:id])
    end
    def add_bio
       if User.where(:id=> session[:user_id]).update_all(:bio=>bio_params[:bio])
        redirect_to new_photo_path
       else
        flash[:error_bio]="something went wrong"
        redirect_to new_photo_path
       end

    end

    
    
    
    private
        def issue_params
            params.require(:issue).permit(:id)
        end
        
         def set_login
             @user=User.find(params[:id])
         end
         def login_params
            params.require(:user).permit(:first_name, :last_name, :phone, :username, :password, :city_id, :accountstatu)  
         end
         def update_params
            params.require(:edit_user).permit(:id,:first_name, :last_name, :username,:phone,:bio)  
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
         def  bio_params
            params.require(:bio).permit(:bio,:id)
         end

       
        
        
        
end
