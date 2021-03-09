require 'rails_helper'

RSpec.describe Surgery, type: :model do
	before :each do
		@doctor_1 = Doctor.create!(name: 'John', years_practiced: 30, uni: 'Case Western')
		@doctor_2 = Doctor.create!(name: 'Mary', years_practiced: 40, uni: 'Anchutz')
		@surgery_1 = Surgery.create!(title: 'Heart Transplant', day: 'Tuesday', room: 113 )
		@surgery_1.doctors << @doctor_1
		@surgery_1.doctors << @doctor_2
	end
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :day }
    it { should validate_presence_of :room }
  end
  describe "relationships" do
    it { should have_many :doctors }
  end

  describe "class methods" do
    it "::averaged_surgeries" do
      #calling to_f as I would really not like to deal with bigdecimal
      expect(Surgery.averaged_surgeries.first.avg_years.to_f).to eq(35.0)
    end
  end

  describe "instance methods" do
  	it "#best_doctor" do
  		expect(@surgery_1.best_doctor.class).to eq(Doctor)
  		expect(@surgery_1.best_doctor.name).to eq("Mary")
  		expect(@surgery_1.best_doctor.years_practiced).to eq(40)
  	end

  	it "#worst_doctor" do
  		expect(@surgery_1.worst_doctor.class).to eq(Doctor)
  		expect(@surgery_1.worst_doctor.name).to eq("John")
  		expect(@surgery_1.worst_doctor.years_practiced).to eq(30)
  	end
  end
end
