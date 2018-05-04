class SharespacesController < ApplicationController
  before_action :set_sharespace, only: [:show, :edit, :update, :destroy]

  # GET /sharespaces
  # GET /sharespaces.json
  def index
    @sharespaces = Sharespace.all
  end

  # GET /sharespaces/1
  # GET /sharespaces/1.json
  def show
  end

  # GET /sharespaces/new
  def new
    @sharespace = Sharespace.new
  end

  # GET /sharespaces/1/edit
  def edit
  end

  # POST /sharespaces
  # POST /sharespaces.json
  def create
    @sharespace = Sharespace.new(sharespace_params)

    respond_to do |format|
      if @sharespace.save
        format.html { redirect_to new_photo_path, notice: 'Sharespace was successfully created.' }
        format.json { render :show, status: :created, location: @sharespace }
      else
        format.html { render :new }
        format.json { render json: @sharespace.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sharespaces/1
  # PATCH/PUT /sharespaces/1.json
  def update
    respond_to do |format|
      if @sharespace.update(sharespace_params)
        format.html { redirect_to @sharespace, notice: 'Sharespace was successfully updated.' }
        format.json { render :show, status: :ok, location: @sharespace }
      else
        format.html { render :edit }
        format.json { render json: @sharespace.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sharespaces/1
  # DELETE /sharespaces/1.json
  def destroy
    @sharespace.destroy
    respond_to do |format|
      format.html { redirect_to sharespaces_url, notice: 'Sharespace was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sharespace
      @sharespace = Sharespace.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sharespace_params
      params.require(:sharespace).permit(:space_type, :description, :cost, :sharespace_venue_id)
    end
end
