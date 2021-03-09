class DoctorSurgeriesController < ApplicationController
	def create
		surgery = Surgery.find(params[:surgery_id])
		doctor = Doctor.find_by name: params[:name]
		DoctorSurgery.create!(surgery_id: surgery.id, doctor_id: doctor.id)
		redirect_to surgery_path(surgery)
	end
end