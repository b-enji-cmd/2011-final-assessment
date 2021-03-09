class SurgeriesController < ApplicationController

	def index
		@surgeries = Surgery.averaged_surgeries
	end

	def show
		@surgery = Surgery.find(params[:id])
		@least_experienced = @surgery.worst_doctor
		@most_experienced = @surgery.best_doctor
	end


end
