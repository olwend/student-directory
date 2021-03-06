@Months =["january","febuary","march","april","may","june","july","august","september","october","november","december"]
#first we print the list of students
# let's put all the students into an array

#@students = [
#  {name: "Dr. Hannibal Lecter", cohort: :november, hobbies: "cooking", country: :Wales, height:"185 cm"},
#  {name: "Darth Vader", cohort: :november,hobbies: "cooking", country: :France, height: "185 cm"},
#  {name: "Nurse Ratched", cohort: :january,hobbies: "cooking", country: :Eire, height: "185 cm"},
#  {name: "Michael Corleone", cohort: :march,hobbies: "cooking", country: :USA, height: "185 cm"},
#  {name: "Alex DeLarge", cohort: :march},
#  {name: "The Wicked Witch of the West", cohort: :november},
#  {name: "Terminator", cohort: :november},
#  {name: "Freddy Krueger", cohort: :june},
#  {name: "The Joker", cohort: :june},
#  {name: "Joffrey Baratheon", cohort: :january},
#  {name: "Norman Bates", cohort: :june}
#]
  @students =[]
def interactive_menu
  loop do
      print_menu
      process(STDIN.gets.chomp)
    end
  end

#1. print the menu and ask user what to do
def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv"
    puts "9. Exit"  #9 because we'll be adding more items
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def show_students
  print_header
  print_index
  print_footer
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end
#use rstrip to get rid of space?
def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def input_students
   puts "Please enter the name of the student"
   #create an empty array
   @students = []
   #gets the first name

   name = STDIN.gets.chomp
   puts "..and the cohort"
   cohort = STDIN.gets.chomp
   #7 supply a default or check against list
   #Use a hash default method? When inputting data to Students
   #while name is not empty, repeat this code
   while !name.empty? do
     #add the student has to the array
     #9.singular and plural
     @students << {name: name, cohort: cohort.to_sym, hobbies: "cooking", country: :Wales, height: "185 cm"}
     case @students.length
     when 1 then puts "We have 1 student"
        when 0 then puts "We have no students?"
        else  puts "Now we have #{@students.count} students"
        end
     puts "To finish, just hit return twice"
     # get another name from the user
     puts "Please enter the name of the student"
     name = STDIN.gets.chomp
     puts "..and the cohort"
     cohort = STDIN.gets.chomp.downcase
     if !@Months.include?(cohort)
       cohort = :april
     end
   end
   # return the array of students
   @students
end

def print_header
   puts "The students of Villains Academy"
   puts "-------------"
end
#5. Add height, hobbies and country  6. use center and ljust
def print_body
    @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort) #{student[:height]} #{student[:country]} ".center(40)
  end
end

#1.amend to add a number
def print_index
  if @students.length > 0
     @students.each_with_index do |student,index|
          puts "#{index}.  #{student[:name]}".ljust(3)
          puts "(#{ student[:cohort]} cohort) #{student[:height]} Height Residency:#{student[:country]}".center(40)
  end
end

#2.create alternative print for specific letter
def print_specific_students
  puts "Which letter student do you want?"
  l = STDIN.gets.chomp
  # could use string.start_with?()
  #create new hash as a subset based on specific letter
  set_students = @students.select {|student|  student[:name].start_with?(l)}
  p set_students
  set_students.each_with_index do |student,index|
    puts "#{index}.#{student[:name]}(#{ student[:cohort]} cohort)".center(40)
   end
end

#3. name.length < 12 chars
def print_less_twelve
  set_students = @students.select {|student|  student[:name].length < 12}
  set_students.each_with_index do |student,index|
    puts "#{index}.#{student[:name]}(#{ student[:cohort]} cohort)#{student[:height]} Height Residency:#{student[:country]}".center(40)
   end
end
#4.convert to use a loop
def loop_body
    i = 0
    while i < @students.length
      #use your count function to count though the index numbers from 0
      #use index to pull name and cohort out of array
          array = @students[i] #gives {:name=>"Olwen", :cohort=>"January"}
          puts array
          i +=1
    end
end
#8. list existing cohorts in @months,iterate over it, only print the students from that cohort month.
#Put into a hash which can be used to print

#def print_by_cohort
def sort_months_list
   students_by_cohort = []
     @Months.each_with_index do |month, index|
        students_by_cohort << @students.select{|student| student[:cohort]== month.to_sym}
     end
#by name
     students_by_cohort.map! do |month|
       month.sort{|a,b| a[:name] <=> b[:name]}
     end
#rebuild list
     @students = []
     @Months.each_with_index do |month,index|
       @students << students_by_cohort[index]
     end
     @students.flatten!
     puts @students
  end
end
#finally, we print the total number of students
def print_footer
  case @students.length
  when 1 then puts "We have 1 great student"
  when 0 then puts "We have no students?"
  else puts "Overall, we have #{@students.count} great students"
  end
end

#10. Try "string\n\r".chop   #=> "string\n"

#nothing happens until we call the methods
#students = input_students
try_load_students
interactive_menu
print print_header
#print print_body
print print_index
#print print_specific_students
#print print_less_twelve
#print loop_body(students)
print sort_months_list
print print_footer
