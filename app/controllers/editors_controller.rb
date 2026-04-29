class EditorsController < ApplicationController
  def show
    @categories =  Category.includes(:tags)

    @selected_category =
      Category.find_by(name: params[:selected_category]) || @categories.first 

    @preset = Preset.find_by(id: params[:preset_id])

    @tags = @selected_category.tags

    # 各カテゴリと紐づくタグのハッシュ
    @category_tag_list = {}
    @categories.each do |category|
      @category_tag_list[category.name] = category.tags.map(&:name)
    end

    @selected_tags = 
      if @preset
        @preset.tags.includes(:category)
      else
        []
      end

    @selected_tag_ids = @selected_tags.map(&:id)

    
  end
end
