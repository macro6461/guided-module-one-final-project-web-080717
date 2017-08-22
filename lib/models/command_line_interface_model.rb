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
       puts "Would you like to see your official class schedule?"
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
    print_class_schedule
  end

  def list_teacher_subjects
    puts "Here are your classes for the day: "
    print_teacher_class_schedule
  end

  def list_students_in_class
    @teacher.students.each do |student|
      puts student.name
    end
    can_we_help
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

  def print_teacher_class_schedule
    subjects = @teacher.subjects.collect do |subject|
      subject.name
    end
    puts subjects.uniq
    puts "Would you like to see a list of your students?"
    see_students
  end

  def print_class_schedule
    puts "|---------------------------------------------------"
    puts "| CLASS  *with*  TEACHER                            "
    @student.teachers.each do |teacher|
      puts "|---------------------------------------------------"
      puts "| #{teacher.subjects[0].name.upcase} *with* #{teacher.name.upcase}"
    end
    can_we_help
  end

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
