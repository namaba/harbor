# == Schema Information
#
# Table name: lives
#
#  id          :bigint           not null, primary key
#  start_at    :datetime         not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  platform_id :bigint           not null
#  talent_id   :bigint           not null
#
# Indexes
#
#  index_lives_on_platform_id  (platform_id)
#  index_lives_on_talent_id    (talent_id)
#
# Foreign Keys
#
#  fk_rails_...  (platform_id => platforms.id)
#  fk_rails_...  (talent_id => talents.id)
#
FactoryBot.define do
  factory :life, class: 'Live' do
    talent { nil }
    platform { nil }
    start_at { "2020-04-26 20:01:38" }
  end
end
