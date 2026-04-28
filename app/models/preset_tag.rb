class PresetTag < ApplicationRecord
  belongs_to :preset
  belongs_to :tag

  validates :preset_id, uniqueness: { scope: :tag_id }
end
