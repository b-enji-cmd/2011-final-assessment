require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :years_practiced }
    it { should validate_presence_of :uni }
  end
  describe "relationships" do
    it { should have_many :surgeries }
  end
end
