
student_count = 11
#first we print the list of students
# let's put all the students into an array
students = [
 "Dr. Hannibal Lecter",
 "Darth Vader",
 "Nurse Ratched",
 "The Wicked Witch of the West",
 "Terminator",
 "Freddy Kreuger",
 "The Joker",
 "Joffrey Baratheon",
 "Norman Bates",
]
puts "The students of Villains Academy"
puts "-------------"
students.each do |student|
  puts student
end
#finally, we print the total number of students
print "Overall, we have #{students.count} great students"
#it's important that print() doesn't add new line characters
