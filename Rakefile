$LOAD_PATH << 'app/models'
p $LOAD_PATH
require 'rake'
require 'rspec/core/rake_task'
require_relative 'db/config'
require_relative 'lib/students_importer'
require_relative 'lib/teachers_importer'
Dir['app/models/**/*.rb'].each do |file|
  require File.basename(file, File.extname(file))
end


desc "create the database"
task "db:create" do
  touch 'db/ar-students.sqlite3'
end

desc "drop the database"
task "db:drop" do
  rm_f 'db/ar-students.sqlite3'
end

desc "migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)."
task "db:migrate" do
  ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
  ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
  ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil) do |migration|
    ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
  end
end

desc "populate the test database with sample data"
task "db:populate" do
  StudentsImporter.import
  TeachersImporter.import
end

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end

desc 'Assign Teacher Student Relationship'
task "db:relationship" do
  JoinTeachersStudent.create!(student_id: 1, teacher_id: 1)
  Teacher.create!({name: 'prof dooooom', email: 'doooom@gmail.com', phone: '408-123-6789'})
  Student.create!({name: 'Lil John', gender: 'shemale', birthday: '1969-01-01', email: 'johnjon@gmail.com', phone: '415-123-1234'})
end

desc "Run the specs"
RSpec::Core::RakeTask.new(:specs)

task :default  => :specs
