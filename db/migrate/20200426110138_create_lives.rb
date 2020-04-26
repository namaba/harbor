class CreateLives < ActiveRecord::Migration[6.0]
  def change
    create_table :lives do |t|
      t.references :talent, null: false, foreign_key: true
      t.references :platform, null: false, foreign_key: true
      t.datetime :start_at, null: false

      t.timestamps
    end
  end
end
