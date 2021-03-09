class Surgery < ApplicationRecord
  validates_presence_of :title,
                        :day,
                        :room

  has_many :doctor_surgeries
  has_many :doctors, through: :doctor_surgeries


  def best_doctor
  	doctors.order("years_practiced DESC").first
  end

  def worst_doctor
 		doctors.order(:years_practiced).first
  end

  def self.averaged_surgeries
  	select("surgeries.*, avg(years_practiced) as avg_years").joins(:doctors).group(:id).order("avg_years desc")
  end
end
