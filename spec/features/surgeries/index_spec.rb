require 'rails_helper'

RSpec.describe 'surgery index page' do
	before :each do
		@doctor_1 = Doctor.create!(name: 'John', years_practiced: 30, uni: 'Case Western')
		@doctor_2 = Doctor.create!(name: 'Mary', years_practiced: 40, uni: 'Anchutz')
		@doctor_3 = Doctor.create!(name: 'Bruce', years_practiced: 50, uni: 'Anchutz')
		@surgery_1 = Surgery.create!(title: 'Heart Transplant', day: 'Tuesday', room: 113 )

		@doctor_4 = Doctor.create!(name: 'Mike', years_practiced: 32, uni: 'Anchutz')
		@doctor_5 = Doctor.create!(name: 'Julie', years_practiced: 35, uni: 'Anchutz')
		@doctor_6 = Doctor.create!(name: 'Annie', years_practiced: 28, uni: 'Anchutz')
		@surgery_2 = Surgery.create!(title: 'Triple Bypass', day: 'Friday', room: 221 )

		@surgery_1.doctors << @doctor_1
		@surgery_1.doctors << @doctor_2
		@surgery_1.doctors << @doctor_3

		@surgery_2.doctors << @doctor_4
		@surgery_2.doctors << @doctor_5
		@surgery_2.doctors << @doctor_6

		visit surgeries_path
	end

	it "displays all surgeries" do
		within("#surgeries") do
			expect(page).to have_content("#{@surgery_1.title}")
			expect(page).to have_content("#{@surgery_2.title}")
		end
	end

	it "displays average years of doctors" do
		within("#surgery-#{@surgery_1}") do
			expect(page).to have_content("Average Years of Experience: 40")
		end
	end

	it "displays surgeries by average years of experience" do
		within("#surgeries") do
			expect(@surgery_1.title).to appear_before(@surgery_2.title)
		end
	end
end