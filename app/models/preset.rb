class Preset < ApplicationRecord
  has_many :preset_tags, dependent: :destroy
  has_many :tags, through: :preset_tags
  has_many :categories, through: :tags

  validates :name, presence: true
end
