require 'csv'

csv = CSV.read('db/fixtures/development/talents_master.csv')

csv.each.with_index(1) do |talent, i|
  Talent.seed(:id) do |s|
    s.id = i
    s.name = talent[0]
    s.memo = talent[2]
    s.instagram_url = talent[4]
    s.youtube_url = talent[5]
  end

  TalentCategory.seed(:talent_id) do |tc|
    tc.talent_id = i
    tc.category_id = talent[1].presence || 30
  end
end