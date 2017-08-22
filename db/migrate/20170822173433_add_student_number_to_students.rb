class AddStudentNumberToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :student_number, :integer
  end
end
