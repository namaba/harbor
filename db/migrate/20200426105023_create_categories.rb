class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :parent, null: false
      t.string :child, null: false

      t.timestamps
    end
  end
end
