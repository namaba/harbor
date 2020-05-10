class AddPvToTalent < ActiveRecord::Migration[6.0]
  def change
    add_column :talents, :pv, :integer, null: false, default: 0, after: :youtube_url
  end
end
