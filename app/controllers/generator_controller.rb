class GeneratorController < ApplicationController
  def index
    @categories = [
      { key: "personality", label: "性格" },
      { key: "hair", label: "髪型" },
      { key: "outfit", label: "服装" },
      { key: "exclude", label: "除外" }
    ]

    @selected_category = params[:category] || "personality"

    all_tags = {
      "personality" => %w[cheerful calm playful energetic shy],
      "hair" => %w[ponytail bob twintail waby],
      "outfit" => %w[saior_uniform hoodie jacket],
      "exclude" => %w[nsfw gore violence]
    }

    @tags = all_tags[@selected_category] || []
    @selected_tags = Array(params[:selected_tags])
    @json_preview = build_json(@selected_tags, all_tags)
  end

  private

  def build_json(selected_tags, all_tags)
    result = {}

    all_tags.each do |category, tags|
      selected = tags & selected_tags
      result[category] = selected if selected.any?
    end
    JSON.pretty_generate({
      prompt_data: result
    })
  end
end
