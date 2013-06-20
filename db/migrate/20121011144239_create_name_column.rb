require_relative '../config'

class CreateNameColumn < ActiveRecord::Migration
  def up
    add_column :students, :name, :string
    remove_column :students, :first_name
    remove_column :students, :last_name

    Student.all.each do |student|
      student.update_attributes!(:name => student.name)
    end
  end

  def down
    remove_column :students, :name
    add_column :students, :first_name, :string
    add_column :students, :last_name, :string

    Student.all.each do |student|
      student.update_attributes!(:name => nil)
    end
  end
end

