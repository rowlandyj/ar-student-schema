require_relative '../../db/config'

class JoinTeachersStudent < ActiveRecord::Base
  belongs_to :teachers
  belongs_to :students 
end
