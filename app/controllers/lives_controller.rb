class LivesController < ApplicationController

  def index
    @target_date = params[:target_date]&.to_datetime || Time.current
    lives = Live.includes(:talent, :platform).future.where(start_at: @target_date.beginning_of_day..@target_date.end_of_day).order(start_at: :ASC)
    @lives = lives.group_by(&:start_at)
  end

  def latest_uploaded
    @lives = Live.last(20)
  end
end
