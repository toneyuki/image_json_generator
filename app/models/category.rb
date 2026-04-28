class Category < ApplicationRecord
  has_many :tags

  validates :name, presence: true
  validates :display_name, presence: true
  validates :image_color, presence: true
  validates :image_color, format: { with: /\A#[0-9a-fA-F]{6}\Z/ }
end
