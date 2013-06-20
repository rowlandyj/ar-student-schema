require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class JoinTeachersStudents < ActiveRecord::Migration


  def change
    create_table :jointeachersstudents do |t|
      t.integer :student_id
      t.integer :teacher_id
    end
  end
end
