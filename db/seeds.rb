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

mike = Student.create(name: "Michael Foster", student_number: 145765, grade: nil)
kyle = Student.create(name: "Kyle Joseph", student_number: 145725, grade: nil)
samantha = Student.create(name: "Samantha Nisanov", student_number: 145835, grade: nil)
maria = Student.create(name: "Maria Malon", student_number: 145002, grade: nil)
lenora = Student.create(name: "Lenora Green", student_number: 145708, grade: nil)
julie = Student.create(name: "Julie Bennet", student_number: 145732, grade: nil)
dave = Student.create(name: "David Connor", student_number: 145822, grade: nil)
kate = Student.create(name: "Kate Martinez", student_number: 145923, grade: nil)
john = Student.create(name: "John Cho", student_number: 145405, grade: nil)
james = Student.create(name: "James Connor", student_number: 145555, grade: nil)
olena = Student.create(name: "Olenna Tyrell", student_number: 145545, grade: nil)
geoff = Student.create(name: "Geoffrey Lannister", student_number: 145206, grade: nil)


#SUBJECTS
#one teacher => many students
history = Subject.create(name: "History", student_id: 1, teacher_id: 1)
history = Subject.create(name: "History", student_id: 2, teacher_id: 1)
history = Subject.create(name: "History", student_id: 3, teacher_id: 1)
history = Subject.create(name: "History", student_id: 4, teacher_id: 1)
history = Subject.create(name: "History", student_id: 5, teacher_id: 1)
history = Subject.create(name: "History", student_id: 6, teacher_id: 1)
history = Subject.create(name: "History", student_id: 7, teacher_id: 1)
history = Subject.create(name: "History", student_id: 8, teacher_id: 1)
history = Subject.create(name: "History", student_id: 9, teacher_id: 1)
history = Subject.create(name: "History", student_id: 10, teacher_id: 1)
history = Subject.create(name: "History", student_id: 11, teacher_id: 1)
history = Subject.create(name: "History", student_id: 12, teacher_id: 1)

math = Subject.create(name: "Math", student_id: 1, teacher_id: 2)
math = Subject.create(name: "Math", student_id: 2, teacher_id: 2)
math = Subject.create(name: "Math", student_id: 4, teacher_id: 2)
math = Subject.create(name: "Math", student_id: 8, teacher_id: 2)
math = Subject.create(name: "Math", student_id: 12, teacher_id: 2)
math = Subject.create(name: "Math", student_id: 11, teacher_id: 2)

english = Subject.create(name: "English", student_id: 1, teacher_id: 3)
english = Subject.create(name: "English", student_id: 2, teacher_id: 3)
english = Subject.create(name: "English", student_id: 3, teacher_id: 3)
english = Subject.create(name: "English", student_id: 4, teacher_id: 3)
english = Subject.create(name: "English", student_id: 5, teacher_id: 3)
english = Subject.create(name: "English", student_id: 7, teacher_id: 3)
english = Subject.create(name: "English", student_id: 8, teacher_id: 3)
english = Subject.create(name: "English", student_id: 11, teacher_id: 3)
english = Subject.create(name: "English", student_id: 10, teacher_id: 3)

gym = Subject.create(name: "Gym", student_id: 4, teacher_id: 4)
gym = Subject.create(name: "Gym", student_id: 5, teacher_id: 4)
gym = Subject.create(name: "Gym", student_id: 6, teacher_id: 4)
gym = Subject.create(name: "Gym", student_id: 7, teacher_id: 4)
gym = Subject.create(name: "Gym", student_id: 8, teacher_id: 4)
gym = Subject.create(name: "Gym", student_id: 9, teacher_id: 4)
gym = Subject.create(name: "Gym", student_id: 10, teacher_id: 4)
gym = Subject.create(name: "Gym", student_id: 11, teacher_id: 4)
gym = Subject.create(name: "Gym", student_id: 12, teacher_id: 4)
gym = Subject.create(name: "Gym", student_id: 1, teacher_id: 4)
gym = Subject.create(name: "Gym", student_id: 2, teacher_id: 4)

shop = Subject.create(name: "Shop Class", student_id: 6, teacher_id: 5)
shop = Subject.create(name: "Shop Class", student_id: 7, teacher_id: 5)
shop = Subject.create(name: "Shop Class", student_id: 8, teacher_id: 5)
shop = Subject.create(name: "Shop Class", student_id: 9, teacher_id: 5)
shop = Subject.create(name: "Shop Class", student_id: 10, teacher_id: 5)
shop = Subject.create(name: "Shop Class", student_id: 11, teacher_id: 5)
shop = Subject.create(name: "Shop Class", student_id: 12, teacher_id: 5)
shop = Subject.create(name: "Shop Class", student_id: 13, teacher_id: 5)
shop = Subject.create(name: "Shop Class", student_id: 14, teacher_id: 5)






#one student => many teachers

#how will I add more students to history subject? Each new instance will have an ID...
#this will be difficult when trying to add multiple students to the same subject class
#under the same teacher...
