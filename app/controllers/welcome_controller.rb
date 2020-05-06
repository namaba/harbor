class WelcomeController < ApplicationController
  def index
    @latest_lives = Live.includes(:talent).last(4)
    #TODO: トレンドのロジック考える
    @trend_lives = Live.includes(:talent).first(4)
    #TODO: ランキングのロジックかんがえる
    @ranking = Talent.includes(:lives).first(4)
  end
end