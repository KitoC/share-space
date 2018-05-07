class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    authorization("admin")
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    authorization("create")
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
    authorization("update", @review)
  end

  # POST /reviews
  # POST /reviews.json
  def create
    authorization("create")
    @review = Review.new(review_params)
    @user = current_user

    respond_to do |format|
      if @review.save(review_params)
        if @review.reviewable_type == "SharespaceVenue"
          format.html {redirect_to @review.reviewable, notice: 'review was successfully updated.' }
          format.json { render :show, status: :ok, location: @review }
        else
          format.html { redirect_to @user, notice: 'review was successfully updated.' }
          format.json { render :show, status: :ok, location: @review }
        end
      else
        format.html { redirect_back(fallback_location: root_path) }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    authorization("update", @review)

    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review.reviewable, notice: 'review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    authorization("destroy", @review)

    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:rating, :review, :reviewable_type, :reviewable_id, :reference_type, :reference_id)
    end
end
