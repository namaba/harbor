class TalentsController < ApplicationController
  before_action :set_talent, only: %i[show archives]

  def index
    @talents = Talent.includes(:lives).all.limit(10)
  end

  def show
    talent_ids = Live.future.pluck(:talent_id)
    @recomend_talents = Talent.find talent_ids.sample(4)
    @talent.ranking_increment
	end

	def archives
		@lives = @talent.lives.past.order(start_at: :ASC)
	end

  private

  def set_talent
    @talent = Talent.includes(:lives).find params[:id]
  end
end
