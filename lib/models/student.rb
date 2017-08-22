class Student < ActiveRecord::Base
  has_many :subjects
  has_many :teachers, through: :subjects

end
