class Api::V1::ProductReviewsController < ApplicationController

  def create
    # Create product review
    @product_review = ProductReview.new(product_review_params)
    if @product_review.save
      send_with_data(200, @product_review, success_message)
    else
      send_without_data(422, set_errors(@product_review))
    end
  end

  def update
    begin
      @product_review = ProductReview.find(params[:id])
      if @product_review.update(product_review_params)
        send_with_data(200, @product_review, success_message)
      else
        send_without_data(422, set_errors(@product_review))
      end
    rescue ActiveRecord::RecordNotFound
      send_without_data(404, {errors: "Review with id #{params[:id]} not found"})
    end
  end

  private

    def product_review_params
      params.require(:product_review).permit(:content, :rating, :product_id)
    end

end
