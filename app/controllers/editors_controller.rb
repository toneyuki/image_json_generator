class EditorsController < ApplicationController
  def show
    @categories =  Category.includes(:tags)

    @selected_category =
      Category.find_by(name: params[:selected_category]) || @categories.first 

    @preset = Preset.find_by(id: params[:preset_id])

    @tags = @selected_category.tags

    # https://docs.ruby-lang.org/ja/latest/method/Array/i/to_h.html
    # タグのname - id・display_nameのマップ（JSで使用）
    @tag_all_map = Tag.all.to_h do |tag|
      [tag.name, {
        id: tag.id,
        display_name: tag.display_name
        }
      ]
    end

    # カテゴリのname - id・display_name・image_colorのマップ（JSで使用）
    @category_all_map = Category.all.to_h do |category|

      [category.name, {
        id: category.id,
        display_name: category.display_name,
        image_color: category.image_color
        }
      ]
    end

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
