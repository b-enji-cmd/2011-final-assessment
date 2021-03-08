require 'rails_helper'

RSpec.describe 'surgery show page' do
	before :each do
		@doctor_1 = Doctor.create!(name: 'John', years_practiced: 30, uni: 'Case Western')
		@doctor_2 = Doctor.create!(name: 'Mary', years_practiced: 40, uni: 'Anchutz')
		@doctor_3 = Doctor.create!(name: 'Bruce', years_practiced: 50, uni: 'Anchutz')
		@surgery_1 = Surgery.create!(title: 'Heart Transplant', day: 'Tuesday', room: 113 )
		DoctorSurgery.create!(doctor_id: @doctor_1.id, surgery_id: @surgery_1.id)
		DoctorSurgery.create!(doctor_id: @doctor_2.id, surgery_id: @surgery_1.id)
		visit surgery_path(@surgery_1)
	end

	it "displays the surgery info" do
		expect(page).to have_content("#{@surgery_1.title}")
		expect(page).to have_content("#{@surgery_1.day}")
		expect(page).to have_content("#{@surgery_1.room}")
	end

	it "displays presiding doctors" do
		within("#doctors") do
			expect(page).to have_content("#{@doctor_1.name}")
			expect(page).to have_content("#{@doctor_2.name}")
		end
	end

	it "has two sections for least and most experienced doctors" do
		within ("#most-experienced") do
			expect(page).to have_content("#{@doctor_2.name}")
			expect(page).to have_content("#{@doctor_2.years_practiced}")
		end

		within ("#least-experienced") do
			expect(page).to have_content("#{@doctor_1.name}")
			expect(page).to have_content("#{@doctor_1.years_practiced}")
		end
	end

	it "displays a field to add a doctor to the surgery" do
		within("#add-doctor") do
			fill_in "name", with: "Bruce"
			click_on "Add Doctor"
		end
		
		within("#doctors") do
			expect(page).to have_content("#{@doctor_3.name}")
		end
	end
end