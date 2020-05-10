class SavePvWorker
  def perform
    talents = Talent.find Talent.ranking.value
    Talent.ranking.value(with_scores: true).each do |value, score|
      talent = talents.find {|t| t.id == value}
      talent.pv += score
      talent.update
    end
  end
end