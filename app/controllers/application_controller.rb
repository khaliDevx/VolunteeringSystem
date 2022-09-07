class ApplicationController < ActionController::Base

    config.serve_static_assets = true
    def check_login
        if session[:user_id].present?
            return true
        else
            flash[:error]="you must be registerd!"
            redirect_to "/new"
        end
    end
    def check_type
        user = User.find_by(:id=>session[:user_id])
        if user.user_type=="Employee"
            return true
        else
            redirect_to '/index'
        end
    end

    def confirm_type
        if cookies[:user_type]=="Admin"
            return true
        else
            flash[:error]="You don't have permision"
            redirect_to "/index"
        end
    end
    def confirm_employee_type
        if (cookies[:user_type]=="Employee"||cookies[:user_type]=="Admin")
            return true
        else
            flash[:error]="You don't have permision"
            redirect_to "/index"
        end
    end
    def blok_or_active
        user = User.find_by(:id=> session[:user_id])
        if user.accountstatu==true
            return true
        else
            redirect_to "/index"
        end
    end
end

