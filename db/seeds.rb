# require 'rest-client'
# require 'json'
#
# url = 'https://imdb.p.mashape.com/movie'
# response = RestClient.get(url)
# JSON.parse(response)


#TEACHERS

mr_jones = Teacher.create(name: "Mr. Daniel Jones", teacher_number: 230675)
dr_howard = Teacher.create(name: "Dr. Michael Howard", teacher_number: 230592 )
ms_dawn = Teacher.create(name: "Ms. Michelle Dawn", teacher_number: 230185)
mr_doyle = Teacher.create(name: "Mr. James Doyle", teacher_number: 230005)
mrs_doyle = Teacher.create(name: "Mrs. Carla Doyle", teacher_number: 230025)


#STUDENTS

mike = Student.create(name: "Michael Foster", student_number: 145765, gpa: 0)
kyle = Student.create(name: "Kyle Joseph", student_number: 145725, gpa: 0)
samantha = Student.create(name: "Samantha Nisanov", student_number: 145835, gpa: 0)
maria = Student.create(name: "Maria Malon", student_number: 145002, gpa: 0)
lenora = Student.create(name: "Lenora Green", student_number: 145708, gpa: 0)
julie = Student.create(name: "Julie Bennet", student_number: 145732, gpa: 0)
dave = Student.create(name: "David Connor", student_number: 145822, gpa: 0)
kate = Student.create(name: "Kate Martinez", student_number: 145923, gpa: 0)
john = Student.create(name: "John Cho", student_number: 145405, gpa: 0)
james = Student.create(name: "James Connor", student_number: 145555, gpa: 0)
olena = Student.create(name: "Olenna Tyrell", student_number: 145545, gpa: 0)
geoff = Student.create(name: "Geoffrey Lannister", student_number: 145206, gpa: 0)


#SUBJECTS
#one teacher => many students
history = Subject.create(name: "History", student_id: 1, teacher_id: 1, student_grade: 0)
history = Subject.create(name: "History", student_id: 2, teacher_id: 1, student_grade: 0)
history = Subject.create(name: "History", student_id: 3, teacher_id: 1, student_grade: 0)
history = Subject.create(name: "History", student_id: 4, teacher_id: 1, student_grade: 0)
history = Subject.create(name: "History", student_id: 5, teacher_id: 1, student_grade: 0)
history = Subject.create(name: "History", student_id: 6, teacher_id: 1, student_grade: 0)
history = Subject.create(name: "History", student_id: 7, teacher_id: 1, student_grade: 0)
history = Subject.create(name: "History", student_id: 8, teacher_id: 1, student_grade: 0)
history = Subject.create(name: "History", student_id: 9, teacher_id: 1, student_grade: 0)
history = Subject.create(name: "History", student_id: 10, teacher_id: 1, student_grade: 0)
history = Subject.create(name: "History", student_id: 11, teacher_id: 1, student_grade: 0)
history = Subject.create(name: "History", student_id: 12, teacher_id: 1, student_grade: 0)

math = Subject.create(name: "Math", student_id: 1, teacher_id: 2, student_grade: 0)
math = Subject.create(name: "Math", student_id: 2, teacher_id: 2, student_grade: 0)
math = Subject.create(name: "Math", student_id: 4, teacher_id: 2, student_grade: 0)
math = Subject.create(name: "Math", student_id: 8, teacher_id: 2, student_grade: 0)
math = Subject.create(name: "Math", student_id: 12, teacher_id: 2, student_grade: 0)
math = Subject.create(name: "Math", student_id: 11, teacher_id: 2, student_grade: 0)

english = Subject.create(name: "English", student_id: 1, teacher_id: 3, student_grade: 0)
english = Subject.create(name: "English", student_id: 2, teacher_id: 3, student_grade: 0)
english = Subject.create(name: "English", student_id: 3, teacher_id: 3, student_grade: 0)
english = Subject.create(name: "English", student_id: 4, teacher_id: 3, student_grade: 0)
english = Subject.create(name: "English", student_id: 5, teacher_id: 3, student_grade: 0)
english = Subject.create(name: "English", student_id: 7, teacher_id: 3, student_grade: 0)
english = Subject.create(name: "English", student_id: 8, teacher_id: 3, student_grade: 0)
english = Subject.create(name: "English", student_id: 11, teacher_id: 3, student_grade: 0)
english = Subject.create(name: "English", student_id: 10, teacher_id: 3, student_grade: 0)

gym = Subject.create(name: "Gym", student_id: 4, teacher_id: 4, student_grade: 0)
gym = Subject.create(name: "Gym", student_id: 5, teacher_id: 4, student_grade: 0)
gym = Subject.create(name: "Gym", student_id: 6, teacher_id: 4, student_grade: 0)
gym = Subject.create(name: "Gym", student_id: 7, teacher_id: 4, student_grade: 0)
gym = Subject.create(name: "Gym", student_id: 8, teacher_id: 4, student_grade: 0)
gym = Subject.create(name: "Gym", student_id: 9, teacher_id: 4, student_grade: 0)
gym = Subject.create(name: "Gym", student_id: 10, teacher_id: 4, student_grade: 0)
gym = Subject.create(name: "Gym", student_id: 11, teacher_id: 4, student_grade: 0)
gym = Subject.create(name: "Gym", student_id: 12, teacher_id: 4, student_grade: 0)
gym = Subject.create(name: "Gym", student_id: 1, teacher_id: 4, student_grade: 0)
gym = Subject.create(name: "Gym", student_id: 2, teacher_id: 4, student_grade: 0)

shop = Subject.create(name: "Shop Class", student_id: 6, teacher_id: 5, student_grade: 0)
shop = Subject.create(name: "Shop Class", student_id: 7, teacher_id: 5, student_grade: 0)
shop = Subject.create(name: "Shop Class", student_id: 8, teacher_id: 5, student_grade: 0)
shop = Subject.create(name: "Shop Class", student_id: 9, teacher_id: 5, student_grade: 0)
shop = Subject.create(name: "Shop Class", student_id: 10, teacher_id: 5, student_grade: 0)
shop = Subject.create(name: "Shop Class", student_id: 11, teacher_id: 5, student_grade: 0)
shop = Subject.create(name: "Shop Class", student_id: 12, teacher_id: 5, student_grade: 0)
shop = Subject.create(name: "Shop Class", student_id: 13, teacher_id: 5, student_grade: 0)
shop = Subject.create(name: "Shop Class", student_id: 14, teacher_id: 5, student_grade: 0)






#one student => many teachers

#how will I add more students to history subject? Each new instance will have an ID...
#this will be difficult when trying to add multiple students to the same subject class
#under the same teacher...
