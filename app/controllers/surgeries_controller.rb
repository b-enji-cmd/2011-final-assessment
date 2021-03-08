class SurgeriesController < ApplicationController

	def index
		@surgeries = Surgery.select("surgeries.*, avg(years_practiced) as avg_years").joins(:doctors).group(:id).order("avg_years desc")
	end

	def show
		@surgery = Surgery.find(params[:id])
		@doctors = DoctorSurgery.all.where(surgery_id: @surgery.id)
		@doctors.each do |doctor|
			@surgery.doctors << Doctor.find(doctor.doctor_id)
		end
	end

	def update
		@surgery = Surgery.find(params[:id])
		@doctor = Doctor.find_by name: params[:name]
		@surgery.doctors << @doctor

		redirect_to surgery_path(@surgery)
	end
end