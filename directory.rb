
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
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(names)
    names.each do |name|
    puts name
    end
end
#finally, we print the total number of students
def print_footer(names)
puts "Overall, we have #{students.count} great students"
end
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
