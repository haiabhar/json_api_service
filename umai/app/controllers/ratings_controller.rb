class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :update, :destroy]

  # GET /ratings
  def index
    @ratings = Rating.all

    render json: @ratings
  end

  # GET /ratings/1
  def show
    render json: @rating
  end

  # POST /ratings
  def create
    @rating = Rating.new(rating_params)
    @rating.rating_ip = request.remote_ip
    if @rating.save
      avg_rating = Rating.where(post_id: @rating.post_id).average(:star).to_f.round(2)
      j = {post_id: @rating.post_id, rating: avg_rating}
      render json: j, status: :created, location: @rating
    else
      render json: @rating.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ratings/1
  def update
    if @rating.update(rating_params)
      avg_rating = Rating.where(post_id: @rating.post_id).average(:star).to_f.round(2)
      j = {post_id: @rating.post_id, rating: avg_rating}
      render json: j
      #render json: @rating
    else
      render json: @rating.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ratings/1
  def destroy
    @rating.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def rating_params
      params.permit(:star, :rating_ip, :post_id)
    end
end
