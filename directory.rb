
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
print print_header
print print_body(students)
print print_footer(students)
