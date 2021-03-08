require 'rails_helper'

RSpec.describe 'doctor index' do
	before :each do
		@doctor_1 = Doctor.create!(name: 'John', years_practiced: 30, uni: 'Case Western')
	end

	it "can see all doctors info" do
		within ("#doctor-#{@doctor_1.id}") do
			expect(page).to have_content("#{@doctor_1.name}")
		end
	end
end