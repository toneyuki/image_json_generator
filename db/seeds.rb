# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_initialize_by(name: genre_name)
#   end
# db/seeds.rb

# 【カテゴリ・タグ】カラーパレット（色ベース）
COLORS = {
  pal_pink:   "#ff6b9d",
  pal_cyan:   "#56cfc5",
  pal_amber:  "#ffe066",
  pal_purple: "#b197fc",
  pal_orange: "#ffa984",
  pal_slate:  "#adb5bd"
}

personality = Category.find_or_initialize_by(name: "personality") do |c| 
  c.display_name = "個性"
  c.image_color = COLORS[:pal_pink]
  c.save!
end

hair = Category.find_or_initialize_by(name: "hair") do |c| 
  c.display_name = "髪型"
  c.image_color = COLORS[:pal_cyan]
  c.save!
end

outfit = Category.find_or_initialize_by(name: "outfit") do |c| 
  c.display_name = "服装"
  c.image_color = COLORS[:pal_amber]
  c.save!
end

exclude = Category.find_or_initialize_by(name: "exclude") do |c| 
  c.display_name = "除外"
  c.image_color = COLORS[:pal_slate]
  c.save!
end

PERSONAL_DEFAULT_DATA = [
  { name: "cheerful",    display_name: "元気" },
  { name: "mysterious",  display_name: "ミステリアス" },
  { name: "energetic",   display_name: "活発" },
  { name: "calm",        display_name: "落ち着いた" },
  { name: "brave",       display_name: "勇敢" },
  { name: "shy",         display_name: "内気" },
  { name: "confident",   display_name: "自信家" },
  { name: "playful",     display_name: "いたずら好き" },
  { name: "serious",     display_name: "真面目" },
  { name: "kind",        display_name: "優しい" },
  { name: "mischievous", display_name: "やんちゃ" },
  { name: "gentle",      display_name: "穏やか" }
]

PERSONAL_DEFAULT_DATA.each do |d|
  personality.tags.find_or_initialize_by(name: d[:name]) do |tag|
    tag.display_name = d[:display_name]
    tag.save!
  end
end 

HAIR_DEFAULT_DATA = [
  { name: "long_hair",  display_name: "ロングヘア" },
  { name: "short_hair", display_name: "ショートヘア" },
  { name: "ponytail",   display_name: "ポニーテール" },
  { name: "twin_tails", display_name: "ツインテール" },
  { name: "bob_cut",    display_name: "ボブカット" },
  { name: "wavy",       display_name: "ウェーブ" },
  { name: "straight",   display_name: "ストレート" },
  { name: "curly",      display_name: "カール" },
  { name: "braided",    display_name: "編み込み" },
  { name: "messy",      display_name: "無造作" },
  { name: "elegant",    display_name: "上品" }
]

HAIR_DEFAULT_DATA.each do |d|
  hair.tags.find_or_initialize_by(name: d[:name]) do |tag|
    tag.display_name = d[:display_name]
    tag.save!
  end
end 

OUTFIT_DEFAULT_DATA = [
  { name: "casual",      display_name: "カジュアル" },
  { name: "formal",      display_name: "フォーマル" },
  { name: "sporty",      display_name: "スポーティ" },
  { name: "gothic",      display_name: "ゴシック" },
  { name: "traditional", display_name: "伝統的" }
]

OUTFIT_DEFAULT_DATA.each do |d|
  outfit.tags.find_or_initialize_by(name: d[:name]) do |tag|
    tag.display_name = d[:display_name]
    tag.save!
  end
end 

EXCLUDE_DEFAULT_DATA = [
  { name: "weapons",     display_name: "武器" },
  { name: "violence",    display_name: "暴力" },
  { name: "nsfw",        display_name: "NSFW" },
  { name: "gore",        display_name: "流血表現" },
  { name: "dark_themes", display_name: "ダークテーマ" }
]

EXCLUDE_DEFAULT_DATA.each do |d|
  exclude.tags.find_or_initialize_by(name: d[:name]) do |tag|
    tag.display_name = d[:display_name]
    tag.save!
  end
end

personality = Category.find_or_initialize_by(name: "personality") do |c| 
  c.display_name = "個性"
  c.image_color = COLORS[:pal_pink]
  c.save!
end