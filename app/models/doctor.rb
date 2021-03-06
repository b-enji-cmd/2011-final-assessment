class Doctor < ApplicationRecord
  validates_presence_of :name,
                        :years_practiced,
                        :uni

  has_many :doctor_surgeries
  has_many :surgeries, through: :doctor_surgeries

  def self.experienced
  	order(years_practiced: :desc)
  end
end
