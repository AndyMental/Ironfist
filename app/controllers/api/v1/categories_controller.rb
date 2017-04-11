class Api::V1::CategoriesController < ApplicationController

  def index
    # Get list of categories
    @categories = Category.all
    send_with_data(200, @categories, success_message)
  end

  def create
    # Create a new category
    @category = Category.new(category_params)
    if @category.save
      send_with_data(200, @category, success_message)
    else
      send_without_data(422, set_errors(@category))
    end
  end

  private

    def category_params
      params.require(:category).permit(:name, :is_active)
    end

    #set is_active value to true of category
    def activate_category
      @category = Category.find(params[:id])
      activate(@category)
    end

    #set is_active value to false of category
    def deactivate_category
      @category = Category.find(params[:id])
      deactivate(@category)
    end

end
