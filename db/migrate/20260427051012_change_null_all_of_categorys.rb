# 
class ChangeNullAllOfCategorys < ActiveRecord::Migration[8.1]
  def change
    change_column :categories, :name, :string, null: false
    change_column :categories, :display_name, :string, null: false
    change_column :categories, :image_color, :string, null: false
  end
end
