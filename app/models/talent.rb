# == Schema Information
#
# Table name: talents
#
#  id            :bigint           not null, primary key
#  image         :string(255)
#  instagram_url :string(255)
#  memo          :text(65535)
#  name          :string(255)      not null
#  pv            :integer          default(0), not null
#  youtube_url   :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Talent < ApplicationRecord
  mount_uploader :image, ImageUploader
  include Redis::Objects

  has_many :lives, class_name: 'Live'
  has_many :talent_categories
  has_many :categories, through: :talent_categories
  accepts_nested_attributes_for :talent_categories, reject_if: :all_blank

  sorted_set :ranking, global: true

  def ranking_increment
    ranking.increment(self.id)
  end

  def total_pv
    ranking[self.id].to_i + pv.to_i
  end

  private

  # 　csvファイルからタレントデータをインポート
  def import_csv
    data_list = CSV.read("live_matome.csv")
    data_list.each_with_index do |d, i|
      if i > 188
        if d[0]
          t = Talent.new({ name: d[0], memo: d[1], instagram_url: d[3], youtube_url: d[4] })
          t.save
        end
      end
    end
  end
end
