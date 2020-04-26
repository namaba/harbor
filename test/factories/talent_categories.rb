# == Schema Information
#
# Table name: talent_categories
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#  talent_id   :bigint           not null
#
# Indexes
#
#  index_talent_categories_on_category_id  (category_id)
#  index_talent_categories_on_talent_id    (talent_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (talent_id => talents.id)
#
FactoryBot.define do
  factory :talent_category do
    talent { nil }
    category { nil }
  end
end
