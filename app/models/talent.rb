# == Schema Information
#
# Table name: talents
#
#  id            :bigint           not null, primary key
#  image         :string(255)
#  instagram_url :string(255)
#  memo          :text(65535)
#  name          :string(255)      not null
#  youtube_url   :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Talent < ApplicationRecord
	mount_uploader :image, ImageUploader

	has_many :lives, class_name: 'Live'

	# 　csvファイルからタレントデータをインポート
	def import_csv
		data_list = CSV.read("live_matome.csv")
		data_list.each_with_index do |d, i|
			if i > 188
				if d[0]
					t = Talent.new({name: d[0], memo: d[1], instagram_url: d[3], youtube_url: d[4]})
					t.save
				end
			end
		end
	end
	
end
