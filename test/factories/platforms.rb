# == Schema Information
#
# Table name: platforms
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :platform do
    name { "MyString" }
  end
end
