require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class JoinTeachersStudents < ActiveRecord::Migration
  def change
    create_table :join_teachers_students do |t|
      t.references :student 
      t.references :teacher 
    end
  end
end
