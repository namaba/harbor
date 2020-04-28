class Admin::TalentsController < Admin::ApplicationController
	before_action :set_talent, only: %i[show edit]

	def index
		@talents = Talent.all
	end

	def new
		@talent = Talent.new
	end

	def create
		@talent = Talent.new(talent_params)
		if @talent.save
			redirect_to admin_talents_path, notice: '保存しました'
		else
			flash[:alert] = @talent.errors.full_messages.join("\n")
			render :new
		end
	end

	def show; end

	def edit; end

	def update
		@talent.attributes = talent_params
		if @talent.save
			redirect_to admin_talent_path(@talent), notice: '更新しました'
		else
			flash[:alert] = '更新に失敗しました'
			render :edit
		end
	end


	private

	def set_talent
		@talent = Talent.find params[:id]
	end
	
	def talent_params
		params.require(:talent).permit(
			:name,
			:instagram_url,
			:youtube_url,
			:memo,
			:image,
		)
		
	end
end