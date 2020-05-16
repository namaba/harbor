class LivesController < ApplicationController
  before_action :set_live, only: %i[show edit update destroy]

  def index
    @target_date = params[:target_date]&.to_datetime || Time.current
    lives = Live.includes(:talent, :platform).future.where(start_at: @target_date.beginning_of_day..@target_date.end_of_day).order(start_at: :ASC)
    @lives = lives.group_by(&:start_at)
  end

  def new
    @live = Live.new
  end

  def create
    @live = Live.new(live_params)
    if @live.save
      redirect_to life_path(@live), notice: '保存しました'
    else
      flash.now[:alert] = @live.errors.full_messages.join("\n")
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    @live.attributes = live_params
    if @live.save
      redirect_to life_path(@live), notice: '更新しました'
    else
      flash.now[:alert] = @live.errors.full_messages.join("\n")
      render :edit
    end
  end

  def destroy
    option = if @live.destroy
               { notice: '削除しました' }
             else
               { alert: '削除に失敗しました' }
             end
    redirect_to root_path, option
  end

  def latest_uploaded
    @lives = Live.last(20)
  end

  private

  def set_live
    @live = Live.find params[:id]
  end

  def live_params
    params.require(:live).permit(
      :platform_id,
      :talent_id,
      :start_at
    )
  end
end
