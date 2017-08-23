class RemoveGradeFromStudents < ActiveRecord::Migration[5.1]
  def change
    remove_column :students, :grade, :integer
  end
end
