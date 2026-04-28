class EditorsController < ApplicationController
  def show
    @categories =  Category.includes(:tags)

    @selected_category =
      Category.find_by(name: params[:selected_category]) || @categories.first 

    @preset = Preset.find_by(id: params[:preset_id])

    @tags = @selected_category.tags

    @selected_tags = 
      if @preset
        @preset.tags.includes(:category)
      else
        []
      end

    @selected_tag_ids = @selected_tags.map(&:id)

    
  end
end
