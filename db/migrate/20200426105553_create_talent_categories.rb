class CreateTalentCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :talent_categories do |t|
      t.references :talent, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
