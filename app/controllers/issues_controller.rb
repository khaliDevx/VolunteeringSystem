class IssuesController < ApplicationController
  before_action :confirm
    

    def new 
        @issue=User.new
    end

    def create 
        
        # @issue=Issue.new(issue_params)
        @issue=Issue.new(issue_params)
        if @issue.save 
            redirect_to "/show"
        else
            render  "new"
        end
    end
    def show 
        
      @issue=Issue.all
    end

    private
        def issue_params
            params.require(:issue).permit(:descrption)  
        end

end
