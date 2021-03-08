class SurgeriesController < ApplicationController
	def show
		@surgery = Surgery.find(params[:id])
		@doctors = DoctorSurgery.all.where(surgery_id: @surgery.id)
		@doctors.each do |doctor|
			@surgery.doctors << Doctor.find(doctor.doctor_id)
		end
	end
end