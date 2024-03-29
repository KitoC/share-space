class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  # GET /photos
  # GET /photos.json
  def index
    authorization("admin")
    @photos = Photo.all
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
  end

  # GET /photos/new
  def new
    authorization("create")
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
    authorization("update", @photo)
  end

  # POST /photos
  # POST /photos.json
  def create
    authorization("create")
    @photo = Photo.new(photo_params)
    @user = current_user

    respond_to do |format|
      if @photo.save(photo_params)
        if @photo.photoable_type == "SharespaceVenue"
          format.html {redirect_to @photo.photoable, notice: 'photo was successfully updated.' }
          format.json { render :show, status: :ok, location: @photo }
        else
          format.html { redirect_to @user, notice: 'photo was successfully updated.' }
          format.json { render :show, status: :ok, location: @photo }
        end
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    authorization("update", @photo)

    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo.photoable, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    authorization("destroy", @photo)

    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:image, :caption, :photoable_type, :photoable_id)
    end
end
