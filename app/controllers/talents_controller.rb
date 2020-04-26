class TalentsController < ApplicationController
	# before_action :set_talent, only: %i[show]

	def show
	end

	private

	def set_talent
		@talent = Talent.find params[:id]
	end
end
