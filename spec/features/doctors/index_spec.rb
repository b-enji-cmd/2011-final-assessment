require 'rails_helper'

RSpec.describe 'doctor index' do
	before :each do
		@doctor_1 = Doctor.create!(name: 'John', years_practiced: 30, uni: 'Case Western')
		@doctor_2 = Doctor.create!(name: 'Mary', years_practiced: 40, uni: 'Anchutz')
		visit doctors_path
	end

	it "can see all doctors info" do
		within ("#doctor-#{@doctor_1.id}") do
			expect(page).to have_content("#{@doctor_1.name}")
			expect(page).to have_content("#{@doctor_1.years_practiced}")
			expect(page).to have_content("#{@doctor_1.uni}")
		end
	end

	it "displays doctors by years of experience" do
		expect(@doctor_2.name).to appear_before(@doctor_1.name)
	end
end