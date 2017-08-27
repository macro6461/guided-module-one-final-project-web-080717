require 'pry'
# require 'colorize'
class CommandLineInterfaceModel

  attr_accessor :student

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
    if @student.gpa >= 90.0
      puts "Your current GPA is" + " #{@student.gpa.round(2)}".bold.green + " 😁"
      puts "Remember this day, #{@student.name.upcase}, for it will be yours for" + " ALL TIME!".bold.green
    elsif @student.gpa.round(2).between?(65.0, 89.99)
      puts "Your current GPA is" + " #{@student.gpa.round(2)}".bold.yellow + " 😒"
      puts "You're doing..." + "fine".bold.yellow + ". Just " + "fine".bold.yellow + ". Are you happy with being..." + "just fine?".bold.yellow + " Or do you want to be more than..." + "just fine".bold.yellow + "?" + "I think you want more than fine but you're too scared to chase" + " GREATNESS".bold.green + ". Chase it. Quit your job. Start a fight. Prove you're alive. If you don't claim your humanity you will become a statistic." + " You have been warned.".bold.red
    elsif @student.gpa.round(2).between?(45.0, 64.99)
      puts "Your current GPA is" + " #{@student.gpa.round(2)}".bold.red + "🔥".blink + "😰" + "🔥".blink
      puts "You are" + " FAILING!!!".bold.red + " get it together #{@student.name}! COME ON! Do you think this is a" + " JOKE???".bold.red + " What have we got here, a fu*&ing comedian?? Private Joker??? I admire your honesty. Hell, I like you. You can come over to my house and - OK I'm getting off track here but the point is you're failing and you need to get it together."
    elsif @student.gpa.round(2) <= 44.99
      puts "Your current GPA is" + " #{@student.gpa.round(2)}".bold.red + "🔥".blink + "😰" + "🔥".blink
      Launchy.open("https://www.youtube.com/watch?v=aYmOqPFyJPw")
    end
    can_we_help
  end

  def before_you_go
    puts "Before you go..."
    puts "Do you want to see who has the highest gpa?"
    yes_or_no
    input = gets.chomp.downcase
    if input == "yes"
      highest_gpa
    elsif input == "no"
      do_you_want_to_see_lowest_gpa
    else
      before_you_go
    end
  end

  def highest_gpa
    all_gpas = Student.all.collect do |student|
      student.gpa
    end
    # binding.pry
    highest = all_gpas.sort.max
    best_student = Student.all.find do |student|
      student.gpa == highest
    end
    puts "#{best_student.name}".bold.green + " has the highest GPA at a WHOPPING" + " #{highest.round(2)}!".bold.green + " 🥇 " + " 🏆 ".blink + " 🥇 " + " 🏆 ".blink + " 🥇 " + " 🏆 ".blink + " 🥇 "
    puts "------------------------------------------------------------------------"
    do_you_want_to_see_lowest_gpa
  end

  def do_you_want_to_see_lowest_gpa
    puts "Do you want to see who had the lowest GPA?"
    yes_or_no
    input = gets.chomp
    if input == "yes"
      lowest_gpa
    elsif input == "no"
      exit_program
    else
      do_you_want_to_see_lowest_gpa
    end
  end

  def lowest_gpa
    all_gpas = Student.all.collect do |student|
      student.gpa
    end
    lowest = all_gpas.sort.min
    worst_student = Student.all.find do |student|
      student.gpa == lowest
    end
    puts "#{worst_student.name}".bold.red + " has the lowest GPA at a PITIFUL" + " #{lowest.round(2)}! ".bold.red + " 😭 " + " 😰 ".blink + " 😭 " + " 😰 ".blink + " 😭 " + " 😰 ".blink + " 😭 "
    puts "------------------------------------------------------------------------"
    exit_program
  end

  def try_again
    puts "Invalid command. ".bold.red + "Please enter either" + " 'teacher' ".bold.green + "or" + " 'student' ".bold.green + "."
    run_again
  end


  def enter_student_number
    puts "Please enter your student number."
    @input = gets.chomp
    if @input != nil
      find_student
    else
      enter_student_number
    end
  end

  def enter_teacher_number
    puts "Please enter your teacher number."
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
    sum = 0
      puts "-----------------------------"
      sorted_students = @teacher.students.sort_by{|student| student.name.split(" ")[1].downcase}
      individual_grade_array = sorted_students.collect do |student|
        subject_grade = Subject.find_by(teacher_id: @teacher.id, student_id: student.id)
        # binding.pry
        printf "%-20s %s\n", student.name, "grade = #{subject_grade.student_grade}"
        sum += subject_grade.student_grade
      end
      puts "-----------------------------"
      class_average = sum.to_f / individual_grade_array.size
      if class_average.round(2) >= 90.0
        puts "The class average is: " + "#{class_average.round(2)}".bold.green + " 🍎 🍎 🍎"
      elsif class_average.round(2).between?(65.0, 89.99)
        puts "The class average is: " + "#{class_average.round(2)}".bold.yellow + " 🍎 🍎"
      elsif class_average.round(2).between?(45.0, 64.99)
        puts "The class average is: " + "#{class_average.round(2)}".bold.red + " 🍎"
        Launchy.open("http://www.gettingsmart.com/2017/04/6-simple-ways-to-become-a-better-teacher-for-your-students/")
      elsif class_average.round(2) <= 44.99
        puts "The class average is: " + "#{class_average.round(2)}".bold.red
        Launchy.open("http://www.alleducationschools.com/secondary-education/what-can-i-do-with-a-teaching-degree/")
      end
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
      before_you_go
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
