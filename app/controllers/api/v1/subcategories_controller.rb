class Api::V1::SubcategoriesController < ApplicationController

  def index
    # Get list of Subcategories
    @subcategories = Subcategory.all
    send_with_data(200, @subcategories, success_message)
  end

  def create
    #create a new subcategory
    @subcategory = Subcategory.new(subcategory_params)
    if @subcategory.save
      send_with_data(200, @subcategory, success_message)
    else
      send_without_data(422, set_errors(@subcategory))
    end
  end

  private

    def subcategory_params
      params.require(:subcategory).permit(:category_id, :name, :is_active)
    end

    #set is_active value to true of subcategory
    def activate_subcategory
      @subcategory = Subcategory.find(params[:id])
      activate(@subcategory)
    end
    #set is_active value to false of subcategory
    def deactivate_subcategory
      @subcategory = Subcategory.find(params[:id])
      deactivate(@subcategory)
    end
end
