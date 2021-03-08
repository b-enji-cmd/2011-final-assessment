class SurgeriesController < ApplicationController
	before_action :find_model
	def show
		@doctors = DoctorSurgery.all.where(surgery_id: @surgery.id)
		@doctors.each do |doctor|
			@surgery.doctors << Doctor.find(doctor.doctor_id)
		end
	end

	def update
		@doctor = Doctor.find_by name: params[:name]
		@surgery.doctors << @doctor

		redirect_to surgery_path(@surgery)
	end

	private

	def surgery_params
		params.permit(:name, :id)
	end

	def find_model
		@surgery = Surgery.find(params[:id])
	end
end