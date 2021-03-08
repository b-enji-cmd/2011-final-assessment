class Surgery < ApplicationRecord
  validates_presence_of :title,
                        :day,
                        :room

  has_many :doctors
end
