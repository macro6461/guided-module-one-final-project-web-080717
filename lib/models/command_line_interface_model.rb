require 'pry'
# require 'colorize'
class CommandLineInterfaceModel


  def greet
    puts "Welcome to the Classy Directory!"
  end

  def gets_user_input
    puts "Are you a student or a teacher?"
    gets.chomp.downcase
  end

  def add_grade
    grade = gets.chomp
    if grade != nil
      current_student = Student.find_by(name: @student.name)
      @subject = Subject.find_by(teacher_id: @teacher.id, student_id: current_student.id)
      @subject.student_grade = grade
      @subject.update(student_grade: grade)
      puts "#{@student.name} now has a grade of #{@subject.student_grade}"
      new_gpa = generate_gpa
      current_student.update(gpa: new_gpa)
      # binding.pry
      can_we_help
    else
      would_you_give_a_grade
    end
    # new_gpa = generate_gpa
    # binding.pry
    # @student.update(gpa: new_gpa)
  end

  def generate_gpa
      sum = 0
      subjects = Subject.all.select do |subject|
        subject.student_id == @student.id
      end
      grades = subjects.collect do |subj|
        subj.student_grade
      end
      grades.each do |grade|
        sum += grade
      end
      @student.update(gpa: (sum.to_f / grades.size))
      @student.gpa
  end

  def view_gpa
    # binding.pry
    puts "Your current GPA is #{@student.gpa}"
    can_we_help
  end

  def try_again
    puts "Invalid command. Please enter either 'teacher' or 'student'."
    run_again
  end


  def enter_student_number
    puts "Pease enter your student number."
    @input = gets.chomp
    if @input != nil
      find_student
    else
      enter_student_number
    end
  end

  def enter_teacher_number
    puts "Pease enter your teacher number."
    @input = gets.chomp
    if @input != nil
      find_teacher
    else
      enter_teacher_number
    end
  end

  def find_student
    # binding.pry
    @student = Student.find_by(student_number: @input)
     if @student != nil
       puts "Hello, #{@student.name}!"
       puts "Would you like to see your official class schedule?"
       yes_or_no
     else
       enter_student_number
     end
     input = gets.chomp.downcase
     if input == "yes"
        list_student_subjects_and_teachers
     elsif input == "no"
         can_we_help
     else
         yes_or_no
         valid_student
     end
  end

  def find_teacher
    # binding.pry
    @teacher = Teacher.find_by(teacher_number: @input)
     if @teacher != nil
       puts "Hello, #{@teacher.name}!"
       puts "Would you like to see what classes you're teaching today?"
       yes_or_no
     else
       enter_teacher_number
     end
     input = gets.chomp.downcase
     if input == "yes"
        list_teacher_subjects
     elsif input == "no"
         can_we_help
     else
         yes_or_no
         valid_teacher
     end
  end

  def valid_student
    input = gets.chomp.downcase
    if input == "yes"
       list_student_subjects_and_teachers
    elsif input == "no"
        can_we_help
    else
        yes_or_no
        valid_student
    end
  end

  def valid_teacher
    input = gets.chomp.downcase
    if input == "yes"
      list_teacher_subjects
    elsif input == "no"
        can_we_help
    else
        yes_or_no
        valid_teacher
    end
  end

  def can_we_help
    puts "Anything else we can help you with?"
    exit_or_continue
  end

  def list_student_subjects_and_teachers
    puts "Here is your official class schedule:"
    print_class_schedule_and_grades
  end

  def print_class_schedule_and_grades
    puts "|-------------------------------------------------------------"
    printf "|%-20s %s\n", "CLASS".bold.green, "             GRADE                  TEACHER".bold.green
    @student.subjects.each do |subject|
      puts "|-------------------------------------------------------------"
      printf "|%-20s %s\n", subject.name.upcase, "#{subject.student_grade}              #{subject.teacher.name.upcase} "
      # binding.pry
    end
      puts "|-------------------------------------------------------------"
    puts "Would you like to view your GPA?"
    yes_or_no
    do_you_want_to_view_your_grade
  end


  def do_you_want_to_view_your_grade
    input = gets.chomp.downcase
    if input == "yes"
      view_gpa
    elsif input == "no"
      can_we_help
    else
      do_you_want_to_view_your_grade
    end
  end

  def list_teacher_subjects
    puts "Today you are teaching: "
    print_teacher_class_schedule
  end

  def see_students
    input = gets.chomp.downcase
    if input == "yes"
       list_students_in_class
    elsif input == "no"
        can_we_help
    else
        yes_or_no
        valid_teacher
    end
  end

  def would_you_give_a_grade
    puts "Would you like to give one of these students a grade?"
    yes_or_no
    input = gets.chomp.downcase
    if input == "yes"
      pick_student
    elsif input == "no"
      can_we_help
    else
      would_you_give_a_grade
    end
  end

  def pick_student
    puts "Please enter the name of the student would you like grade."
    input = gets.chomp.split.map(&:capitalize).join(' ')
    @student = Student.find_by(name: input)
     if @student != nil
       puts "Please enter a grade for #{@student.name}"
       add_grade
     else
       pick_student
     end
  end

  def list_students_in_class
    # subjects = @teacher.subjects.collect do |subject|
      puts "-----------------------------"
      @teacher.students.each do |student|
        subject_grade = Subject.find_by(teacher_id: @teacher.id, student_id: student.id)
        # binding.pry
        printf "%-20s %s\n", student.name, "grade = #{subject_grade.student_grade}"
      end
      puts "-----------------------------"
    # end
    would_you_give_a_grade
  end

  def print_teacher_class_schedule
    subjects = @teacher.subjects.collect do |subject|
      subject.name
    end
    puts "------------------------------"
    puts subjects.uniq
    puts "------------------------------"
    puts "Would you like to see a list of your students?"
    see_students
  end

##### HELPERS #####

  def exit_or_continue
    yes_or_no
    input = gets.chomp.downcase
    if input == "yes"
      run_again
    elsif input == "no"
      exit_program
    else
      exit_or_continue
    end
  end

  def exit_program
    puts "Have a wonderful day!"
    exit!
  end

  def yes_or_no
    puts "Please enter yes or no."
  end

  def run_again
    input = gets_user_input
    if input == "teacher"
      enter_teacher_number
    elsif input == "student"
      enter_student_number
    elsif input == "exit"
      exit_program
    else
      try_again
    end
  end

  def run
    greet
    input = gets_user_input
    if input == "teacher"
      enter_teacher_number
    elsif input == "student"
      enter_student_number
    elsif input == "exit"
      exit_program
    else
      try_again
    end
  end
end
