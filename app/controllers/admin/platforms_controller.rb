class Admin::PlatformsController < Admin::ApplicationController
	before_action :set_platform, only: %i[edit update destroy]

	def index
		@platforms = Platform.all
	end

	def new
		@platform = Platform.new
	end

	def create
		@platform = Platform.new(platform_params)
		if @platform.save
			redirect_to admin_platforms_path, notice: '保存しました'
		else
			flash.now[:alert] = @platform.errors.full_messages.join("\n")
			render :new
		end
	end

	def edit; end

	def update
		@platform.attributes = platform_params
		if @platform.save
			redirect_to admin_platforms_path, notice: '更新しました'
		else
			flash.now[:alert] = @platform.errors.full_messages.join("\n")
			render :edit
		end
	end

	def destroy
		option = if @platform.destroy
			{notice: '削除しました'}
		else
			{alert: '削除に失敗しました'}
		end
		redirect_to admin_platforms_path, option
	end

	private

	def set_platform
		@platform = Platform.find params[:id]
	end

	def platform_params
		params.require(:platform).permit(
			:name
		)
	end
	
	
end