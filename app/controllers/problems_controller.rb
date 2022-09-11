class ProblemsController < ApplicationController
  layout 'application'
  before_action :set_problem, only: %i[ show edit update destroy ]
  before_action :blok_or_active,except: [:show, :edit, :update, :confirm] 
  before_action :check_login
  before_action :check_status
  # GET /problems or /problems.json
  def index
    @problems = Problem.where(["status LIKE ?","%#{params[:search]}%"]).with_attached_image
    @x=params[:id]
    @city=City.where(:governorate_id=> params[:id])
    # @accept=Accept.where("problem_id: Problem.where(id:81)")
    # if @accept.required_volunteer >5
    #   @x="nlkhvj;d"
    # end

  end

  # GET /problems/1 or /problems/1.json
  def show
    @problems = Problem.issue_submitted.with_attached_image
    @user=User.where(:id=>session[:user_id])
  end

  # GET /problems/new
  def new
    
    @problem = Problem.new
    @x=params[:id]
    @city=City.all
  end

  # GET /problems/1/edit
  def edit
    if user = Problem.where(:id=>params[:id]).present?
      @problem = Problem.find(params[:id])
      @city=City.all
    else
      redirect_to '/index'
    end
  end

  # POST /problems or /problems.json
  def create
    user=User.find_by(:id=>session[:user_id]) 
    if user.accountstatu==false
      redirect_to new_problem_path
    else
      @problem = Problem.new(problem_params)
      @problem.user_id=session[:user_id]
      respond_to do |format|
        if @problem.save
          if user.user_type=="Volunteer"
          format.html { redirect_to '/index', notice: "Problem was successfully created." }
          format.json { render :show, status: :created, location: @problem }
        elsif user.user_type=="Employee"
          format.html { redirect_to '/issue', notice: "Problem was successfully created." }
          format.json { render :show, status: :created, location: @problem }
          end
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @problem.errors, status: :unprocessable_entity }
        end
      end
    end
   
  end

  # PATCH/PUT /problems/1 or /problems/1.json
  def update
    user=User.find_by(:id=>session[:user_id]) 
    respond_to do |format|
      if @problem.update(problem_params)
        if user.user_type=="Employee"
        format.html { redirect_to '/issue', notice: "Problem was successfully updated." }
        format.json { render :show, status: :ok, location: @problem }
        elsif user.user_type=="Volunteer"
          format.html { redirect_to '/index', notice: "Problem was successfully updated." }
          format.json { render :show, status: :ok, location: @problem }
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /problems/1 or /problems/1.json
  def destroy
    user=User.find_by(:id=>session[:user_id]) 
    @problem.destroy
    if user.user_type=="Employee"
    respond_to do |format|
      format.html { redirect_to '/issue', notice: "Problem was successfully destroyed." }
      format.json { head :no_content }
    end
      elsif user.user_type=="Volunteer"
        respond_to do |format|
          format.html { redirect_to '/index', notice: "Problem was successfully destroyed." }
          format.json { head :no_content }
        end
    end
  end
  def confirm 
      user=User.where(:id=>session[:user_id])
      respond_to do |format|
      confirm=Confirm.new(confirm_prams)
        if user=Confirm.find_by(:problem_id=>confirm_prams[:problem_id],:user_id=>session[:user_id])
         Confirm.where(:problem_id=>confirm_prams[:problem_id],:user_id=>session[:user_id]).update(:confirmed=>confirm_prams[:confirmed])
           format.html { redirect_to '/index', notice: "Confirmed." }
        else
           confirm.user_id=session[:user_id]
           if confirm.save 
              format.html { redirect_to '/index', notice: "Confirmed." }
           end
        end
      end
  end
  def accept
    @problem = Problem.find_by(:id=>params[:id])
    @accept = Accept.find_by(:user_id=> session[:user_id])
  end
  def accept_issue
    accept=Accept.new(accept_params)
    accept.user_id=session[:user_id]
    accept.problem_id=params[:problem_id]
    accept.totale_cost = 0
    respond_to do |format|
      if accept.save 
        Problem.where(id:params[:problem_id]).update_all(:status=>"Accepted")
        User.where(:id=>session[:user_id]).update_all(:supervisor=>true)
        format.html { redirect_to '/accept', notice: "accepted." }
      else
          flash[:error_accept]="something went wrong"
          format.html { redirect_to '/accept', notice: "something went wrong." }
      end
    end
  end
  def accept_mat 
    bill = BillOfMaterial.new(matt_params)
    bill.accept_id= accept.id
    bill.material_id= params[:material_id]
    accept = Accept.find_by(:problem_id=>params[:problem_id])
    total = accept.totale_cost
    respond_to do |format|
      if bill.save
        total_cost = total+(bill.cost * bill.quantity)
        Accept.where(:id=>accept.id).update_all(:totale_cost=>total_cost)
        format.html { redirect_to '/accept', notice: "accepted." }
      else
        # flash[:error_accept]="something went wrong"
        format.html { redirect_to '/accept', notice: "something went wrong." }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_problem
      @problem = Problem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def problem_params
      
     params.require(:problem).permit(:image, :cordinates,  :status, :desciption, :governorate_id, :category_id,:city_id,:user_id)  

    end
    def confirm_prams
      params.require(:confirm).permit(:problem_id ,:user_id ,:confirmed)
   end
   def accept_params
    params.require(:accept).permit(:user_id,:required_volunteer, :problem_id, :total_cost)
   end
   def matt_params
    params.require(:acce_matt).permit(:material_id, :cost, :quantity,:accept_id)
   end

end
