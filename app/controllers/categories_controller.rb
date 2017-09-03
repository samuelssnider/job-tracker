class CategoriesController < ApplicationController
	def index
		@categories = Category.all
	end

	def show
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		@category.save
		redirect_to category_path(@category)
	end

	private
	def category_params
		params.require(:category).permit(:title)
	end
end
