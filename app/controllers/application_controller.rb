class ApplicationController < ActionController::Base

    config.serve_static_assets = true
    def confirm
        if session[:user_id].present?
            return true
        else
            flash[:error]="pleass log in"
            redirect_to "/"
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
    
end

