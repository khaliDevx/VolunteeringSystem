class PhotosController < ApplicationController
  layout :false
  before_action :set_photo, only: %i[ show edit update destroy ]
  before_action :check_login

  # GET /photos or /photos.json
  def index
    @photos = Photo.all
  end

  # GET /photos/1 or /photos/1.json
  def show
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos or /photos.json
  def create
    @photo = Photo.new(photo_params)
    user=User.find_by(:id=>session[:user_id]) 
    respond_to do |format|
      if @photo.save
        if user.user_type=="Employee"
          format.html { redirect_to new_photo_path, notice: "Photo was successfully created." }
          format.json { redirect_to '/issue', status: :created, location: @photo }
        elsif user.user_type=="Volunteer"
          format.html { redirect_to new_photo_path, notice: "Photo was successfully created." }
          format.json { redirect_to '/index', status: :created, location: @photo }
        end
        else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1 or /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to '/profile' , notice: "Photo was successfully updated." }
        format.json { redirect_to '/profile' }
      else
        format.html { redirect_to '/profile' , notice: "Photo was successfully updated." }
        format.json { redirect_to '/profile' }
      end
    end
  end

  # DELETE /photos/1 or /photos/1.json
  def destroy
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_url, notice: "Photo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def photo_params
      
      params.require(:photo).permit(:image, :user_id)
    end
end
