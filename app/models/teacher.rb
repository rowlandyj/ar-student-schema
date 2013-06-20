require_relative '../../db/config'
require 'date'

class Teacher < ActiveRecord::Base
  has_many :jointeachersstudents, foreign_key: :teacher_id
  has_many :students, through: :jointeachersstudent

  validates :email, :uniqueness => true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
end
