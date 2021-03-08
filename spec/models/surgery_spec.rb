require 'rails_helper'

RSpec.describe Surgery, type: :model do
	before :each do
		@doctor_1 = Doctor.create!(name: 'John', years_practiced: 30, uni: 'Case Western')
		@doctor_2 = Doctor.create!(name: 'Mary', years_practiced: 40, uni: 'Anchutz')
		@surgery_1 = Surgery.create!(title: 'Heart Transplant', day: 'Tuesday', room: 113 )
		DoctorSurgery.create!(doctor_id: @doctor_1.id, surgery_id: @surgery_1.id)
		DoctorSurgery.create!(doctor_id: @doctor_2.id, surgery_id: @surgery_1.id)
	end
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :day }
    it { should validate_presence_of :room }
  end
  describe "relationships" do
    it { should have_many :doctors }
  end

  describe "instance methods" do
  	it "#best_doctor" do
  		expect(@surgery_1.best_doctor.class).to eq(Hash)
  		expect(@surgery_1.best_doctor[:name]).to eq("Mary")
  		expect(@surgery_1.best_doctor[:years]).to eq(40)
  	end

  	it "#worst_doctor" do
  		expect(@surgery_1.best_doctor.class).to eq(Hash)
  		expect(@surgery_1.best_doctor[:name]).to eq("John")
  		expect(@surgery_1.best_doctor[:years]).to eq(30)
  	end
  end
end
