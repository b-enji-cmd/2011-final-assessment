require 'rails_helper'

RSpec.describe 'doctor index' do
	before :each do
		@doctor_1 = Doctor.create!(name: 'John', years_practiced: 30, uni: 'Case Western')
	end

	it "can see all doctors info" do
		visit doctor_index_path(@doctor_1)
		within ("#doctor-#{@doctor_1.id}") do
			expect(page).to have_content("#{@doctor_1.name}")
			expect(page).to have_content("#{@doctor_1.years_practiced}")
			expect(page).to have_content("#{@doctor_1.uni}")
		end
	end
end