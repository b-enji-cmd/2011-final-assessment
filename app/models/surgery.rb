class Surgery < ApplicationRecord
  validates_presence_of :title,
                        :day,
                        :room

  has_many :doctors

  def best_doctor
  	best = {}
  	best_doctor = doctors.order("years_practiced DESC").limit(1).first
  	best[:name] = best_doctor.name
  	best[:years] = best_doctor.years_practiced
  	best
  end

  def worst_doctor
  	worst = {}
  	worst_doctor = doctors.order(:years_practiced).limit(1).first
  	worst[:name] = worst_doctor.name
  	worst[:years] = worst_doctor.years_practiced
  	worst
  end
end
