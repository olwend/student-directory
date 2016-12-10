
#first we print the list of students
# let's put all the students into an array

students = [
  {name: "Dr. Hannibal Lecter", cohort: :november, hobbies: "cooking", country: :Wales, height:"185 cm"},
  {name: "Darth Vader", cohort: :november,hobbies: "cooking", country: :France, height: "185 cm"},
  {name: "Nurse Ratched", cohort: :november,hobbies: "cooking", country: :Eire, height: "185 cm"},
  {name: "Michael Corleone", cohort: :november,hobbies: "cooking", country: :USA, height: "185 cm"},
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
     students << {name: name, cohort: :november, hobbies: "cooking", country: :Wales, height: "185 cm"}
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
#5. Add height, hobbies and country
def print_body(students)
    students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort) #{student[:height]} #{student[:country]} ".center(40)
  end
end

#1.amend to add a number
def print_index(students)
  students.each_with_index do |student,index|
    #iterates through and selects just those letter == X
    #students.select {|name:, cohort:| name =="H*"}
    puts "#{index}.#{student[:name]}(#{ student[:cohort]} cohort)".center(40)
  end
end
#2.create alternative print for specific letter
def print_specific_students(students)
  puts "Which letter student do you want?"
  l = gets.chomp
  # could use string.start_with?()
  #create new hash as a subset based on specific letter
  set_students = students.select {|name:,cohort:| name.start_with?(l)}
  set_students.each_with_index do |student,index|
    puts "#{index}.#{student[:name]}(#{ student[:cohort]} cohort)"
   end
end
#3. name.length < 12 chars
def print_less_twelve(students)
  set_students = students.select {|name:,cohort:| name.length < 12}
  set_students.each_with_index do |student,index|
    puts "#{index}.#{student[:name]}(#{ student[:cohort]} cohort)"
   end
end
#4.
def loop_body(students)
    i = 0
    while i < students.length
      #use your count function to count though the index numbers from 0
      #use index to pull name and cohort out of array
          array = students[i] #gives {:name=>"Olwen", :cohort=>"January"}
          puts array
          i +=1
    end
end

#finally, we print the total number of students
def print_footer(students)
puts "Overall, we have #{students.count} great students"
end

#nothing happens until we call the methods
#students = input_students
print print_header
print print_body(students)
#print print_index(students)
#print print_specific_students(students)
#print print_less_twelve(students)
#print loop_body(students)
print print_footer(students)
