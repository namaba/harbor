class Admin::TalentsController < Admin::ApplicationController
	before_action :set_talent, only: %i[show]

	def index
		@talents = Talent.all
	end

	def new
		@talent = Talent.new
	end

	def create
		@talent = Talent.new(talent_params)
		if @talent.save
			redirect_to @talent, notice: '登録しました'
		else
			flash[:alert] = @talent.errors.full_messages.join("\n")
			render :new
		end
	end

	def show; end

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