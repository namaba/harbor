# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  child      :string(255)      not null
#  parent     :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :category do
    parent { "MyString" }
    child { "MyString" }
  end
end
