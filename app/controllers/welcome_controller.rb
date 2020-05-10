class WelcomeController < ApplicationController
  def index
    today = Time.current
    tomorrow = Time.current.tomorrow
    @latest_lives = Live.includes(:talent).last(5)
    @today_lives = Live.includes(:talent).where(start_at: (today - 1.hour)..today.end_of_day).order(start_at: :ASC).limit(5)
    @tomorrow_lives = Live.includes(:talent).where(start_at: tomorrow.beginning_of_day..tomorrow.end_of_day).order(start_at: :ASC).limit(5)
    @ranking = Talent.all.sort_by { |t| t.total_pv }.reverse.first(5)
  end
end