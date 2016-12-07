
#first we print the list of students
# let's put all the students into an array

students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]
#puts a check of hash
#puts "Students N -Z:"
#puts students.select {|name:,cohort:| name > "N*" }
def input_students
   puts "Please enter the names of the students"
   puts "To finish, just hit return twice"
   #create an empty array
   students = []
   #gets the first name
   name = gets.chomp
   #while name is not empty, repeat this code
   while !name.empty? do
     #add the student has to the array
     students << {name: name, cohort: :november}
     puts "Now we have #{students.count} students"
     # get another name from the user
     name = gets.chomp
   end
   # return the array of students
   students
end

def print_header
   puts "The students of Villains Academy"
   puts "-------------"
end
#def print(students)
#  students.each { |n| puts "#{n[:name]} (#{n[:cohort]} cohort)".center(40) }
#end
def print_body(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

#finally, we print the total number of students
def print_footer(students)
puts "Overall, we have #{students.count} great students"
end

#nothing happens until we call the methods
students = input_students
print print_header
print print_body(students)
print print_footer(students)
