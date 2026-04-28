class CreateTags < ActiveRecord::Migration[8.1]
  def change
    create_table :tags do |t|
      t.references :category, null: false, foreign_key: true
      t.string :name, null: false
      t.string :display_name, null: false

      t.timestamps
    end

    add_index :tags, [:category_id, :name], unique: true
  end
end
