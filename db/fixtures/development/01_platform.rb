platforms = [
  'Instagram', 'IGTV', 'YouTube', 'LINE LIVE', '17 Live', 'LiveMe', 'Showroom', 'TIKTOK',
  'ニコニコ生放送', 'Facebook Live', 'Periscope', 'Abema TV / FRESH!', 'USTREAM', 'ULIZA',
  'Pococha', 'RakutenLive'
]
platforms.each.with_index(1) do |platform, i|
  Platform.seed(:id)do |p|
    p.id = i
    p.name = platform
  end
end