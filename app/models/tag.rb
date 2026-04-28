class Tag < ApplicationRecord
  belongs_to :category
  has_many :preset_tags, dependent: :destroy
  has_many :preset, through: :preset_tags

  validates :name, presence: true
  validates :name, uniqueness: { scope: :category_id }
end