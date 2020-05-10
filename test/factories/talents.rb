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
FactoryBot.define do
  factory :talent do
    name { "MyString" }
    instagram_url { "MyString" }
    youtube_url { "MyString" }
    memo { "MyText" }
    image { "MyString" }
  end
end
