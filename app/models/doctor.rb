class Doctor < ApplicationRecord
  validates_presence_of :name,
                        :years_practiced,
                        :uni

  has_many :surgeries
end
