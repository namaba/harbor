class SavePvJob < ApplicationJob
  queue_as :default

  def perform
    talents = Talent.find Talent.ranking.value
    Talent.ranking.value(with_scores: true).each do |value, score|
      talent = talents.find {|t| t.id == value.to_i}
      return if talent.blank?
      talent.pv += score
      talent.save
    end
    Talent.ranking.clear
  end
end