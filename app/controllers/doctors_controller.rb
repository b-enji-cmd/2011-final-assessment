class DoctorsController < ApplicationController
	def index
		@doctors = Doctor.experienced
	end
end
