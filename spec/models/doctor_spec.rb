require 'rails_helper'

RSpec.describe Doctor, type: :model do
	before :each do
		@doctor_1 = Doctor.create!(name: 'John', years_practiced: 30, uni: 'Case Western')
		@doctor_2 = Doctor.create!(name: 'Mary', years_practiced: 40, uni: 'Anchutz')
		@doctor_3 = Doctor.create!(name: 'Angie', years_practiced: 50, uni: 'Anchutz')
	end
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :years_practiced }
    it { should validate_presence_of :uni }
  end
  describe "relationships" do
    it { should have_many :surgeries }
  end

  describe "class methods" do
  	it "::experienced" do
  		expected = [@doctor_3,@doctor_2,@doctor_1]
  		expect(Doctor.experienced).to eq(expected)
  		expect( Doctor.experienced.first.years_practiced > Doctor.experienced.last.years_practiced).to eq(true)
  	end
  end
end
