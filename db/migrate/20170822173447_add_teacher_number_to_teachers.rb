class AddTeacherNumberToTeachers < ActiveRecord::Migration[5.1]
  def change
    add_column :teachers, :teacher_number, :integer
  end
end
