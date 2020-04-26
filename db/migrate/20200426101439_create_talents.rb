class CreateTalents < ActiveRecord::Migration[6.0]
  def change
    create_table :talents do |t|
      t.string :name, null: false
      t.string :instagram_url
      t.string :youtube_url
      t.text :memo
      t.string :image

      t.timestamps
    end
  end
end
