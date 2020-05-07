platform_count = Platform.count

Talent.where(id: 1..100).each.with_index do |t, i|
  start_at = Time.current.change(hour: Random.rand(1..24))
  Live.seed(:id) do |s|
    s.id = i
    s.talent_id = t.id
    s.platform_id = Random.rand(1..platform_count)
    s.start_at = start_at
  end
end

Talent.where(id: 1..100).each.with_index(Talent.count + 1) do |t, i|
  start_at = Time.current.tomorrow.change(hour: Random.rand(1..24))
  Live.seed(:id) do |s|
    s.id = i
    s.talent_id = t.id
    s.platform_id = Random.rand(1..platform_count)
    s.start_at = start_at
  end
end