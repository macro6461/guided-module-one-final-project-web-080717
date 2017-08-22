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

mike = Student.create(name: "Michael Foster", student_number: 145765)
kyle = Student.create(name: "Kyle Joseph", student_number: 145725)
samantha = Student.create(name: "Samantha Nisanov", student_number: 145835)
maria = Student.create(name: "Maria Malon", student_number: 145002)
lenora = Student.create(name: "Lenora Green", student_number: 145708)
julie = Student.create(name: "Julie Bennet", student_number: 145732)
dave = Student.create(name: "David O'Connor", student_number: 145822)
kate = Student.create(name: "Kate Martinez", student_number: 145923)
john = Student.create(name: "John Cho", student_number: 145405)
james = Student.create(name: "James Connor", student_number: 145555)
olena = Student.create(name: "Olenna Tyrell", student_number: 145545)
geoff = Student.create(name: "Geoffrey Lannister", student_number: 145206)


#SUBJECTS
#one teacher => many students
history = Subject.create(name: "History", student_id: 1, teacher_id: 1)
history = Subject.create(name: "History", student_id: 2, teacher_id: 1)
history = Subject.create(name: "History", student_id: 3, teacher_id: 1)

#one student => many teachers
math = Subject.create(name: "Math", student_id: 1, teacher_id: 2)
english = Subject.create(name: "English", student_id: 1, teacher_id: 3)
gym = Subject.create(name: "Gym", student_id: 1, teacher_id: 4)

#how will I add more students to history subject? Each new instance will have an ID...
#this will be difficult when trying to add multiple students to the same subject class
#under the same teacher...
