class Admin::CategoriesController < Admin::ApplicationController
	before_action :set_category, only: %i[edit update destroy]

	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			redirect_to admin_categories_path, notice: '保存しました'
		else
			flash.now[:alert] = @category.errors.full_messages.join("\n")
			render :new
		end
	end

	def edit; end

	def update
		@category.attributes = category_params
		if @category.save
			redirect_to admin_categories_path, notice: '更新しました'
		else
			flash.now[:alert] = @category.errors.full_messages.join("\n")
			render :edit
		end
	end

	def destroy
		option = if @category.destroy
			{notice: '削除しました'}
		else
			{alert: '削除に失敗しました'}
		end
		redirect_to admin_categories_path, option
	end

	private

	def set_category
		@category = Category.find params[:id]
	end

	def category_params
		params.require(:category).permit(
			:title
		)
	end
	
	
end