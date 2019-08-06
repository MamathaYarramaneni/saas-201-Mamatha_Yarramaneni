require_relative './department' # Include other files in the same directory

# Your application
class Application
   attr_accessor :departments

  def initialize
     self.departments=[]
     #self.departments = ['EEE', 'MECH', 'CSE', 'CIVIL'].each { |dept| Department.new(dept) }
     ['EEE', 'MECH', 'CSE', 'CIVIL'].each do |dept| 
      self.departments<<Department.new(dept) 
    end
  end

  def show
    self.departments.each do |dept|
      dept.show
    end
  end

  def enroll(student_name, student_department)
     department = self.departments.detect { |dept| dept.get_name == student_department}
     section=department.get_section
     sect=section[0]
     #department.sortdet
     rollno=department.get_name+section
     department.add_rollno(student_name,rollno)
     puts "You have been enrolled to #{student_department}" \
     "\nYou have been allotted section #{sect}" \
     "\nYour roll number is #{rollno}"
     
  end

  def change_dept(student_name, student_department)
    ## write some logic to frame the string below
    rollno=""
    old_dept=""
    self.departments.each do |dept|
      rollno=dept.get_details(student_name)
      if rollno != nil
        puts "rollno is #{rollno}"
        i=-1
        while rollno[i]>='0' and rollno[i] <='9'
            i=i-1
        end
        puts "Section is #{rollno[i]}"
        old_dept=dept
        break
      end
      #if putsdept.get_details(student_name)
       # dept.remove_rollno(student_name)
        #puts "#{student_name} removed"
        #break
      #end
    end
    department = self.departments.detect { |dept| dept.get_name == student_department}
    section=department.get_section
    if section==0
      "Error:seats are not available in #{student_department}" \
    else  
      old_dept.remove_rollno(student_name)
      sect=section[0]
      rollno=department.get_name+section
      department.add_rollno(student_name,rollno)
      "You have been enrolled to #{student_department}" \
      "\nYou have been allotted section #{sect}" \
      "\nYour roll number is #{rollno}"
    end
  end

  def change_section(student_name, section)
    ## write some logic to frame the string below
    rollno=""
    old_dept=""
    self.departments.each do |dept|                       # This block is for finding the department
      rollno=dept.get_details(student_name)               # of the given student
      if rollno != nil
        #puts "rollno is #{rollno}"
        i=-1
        while rollno[i]>='0' and rollno[i] <='9'
            i=i-1
        end
        #puts "Section is #{rollno[i]}"
        old_dept=dept
        break
      end
    end
    sectcnt=old_dept.get_seats_in_section(section)
    #puts sectcnt
    if sectcnt>=1
      old_dept.remove_rollno(student_name)
      sect=old_dept.get_specific_section_rollno(section)
      #sect=section[0]
      #rollno=old_dept.get_name+section.to_s
      rollno=old_dept.get_name+sect.to_s
      old_dept.add_rollno(student_name,rollno)
      #{}"You have been enrolled to #{student_department}" \
      "\nYou have been allotted section #{section}" \
      "\nYour roll number is #{rollno}"
    else
      puts "Error:seats are not available "
    end
   
  end

  def department_view(student_dept)
    ## write some logic to frame the string below
    department = self.departments.detect { |dept| dept.get_name == student_dept}
    #{}"List of students:" \
        department.show_details
  end

  def section_view(student_dept, section)
    ## write some logic to frame the string below
    department = self.departments.detect { |dept| dept.get_name == student_dept}
    section=department.get_section
    puts "List of students:" 
    department.studentslist.each do |key,val|
        puts "#{key} - #{val}"
    end
    
  end

  def student_details(student_name)
    #self.departments.each do |dept|

    #if((dept.get_details(student_name))==student_name)  
    #  department=dept
    #end
    #end
    ## write some logic to frame the string below
    "#{student_name }- CSE - Section A -"
  end
end
