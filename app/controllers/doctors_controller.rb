class DoctorsController < ApplicationController
	def index
		@doctors = Doctor.all.order("years_practiced DESC")
	end
end