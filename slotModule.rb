module SlotModule
  class Slot
    def initialize()
      @booked = false
      @patient = nil
    end
    def isBooked
      @booked
    end
    def setPatient
      @patient = inputDatails
      @booked = true
    end
    def removePatient
      @patient = nil
      @booked = false
      return true
    end
  
    REGEX_PATTERN = /\A[\w+\-.]+@gmail\.com$/
    def validEmail? email
      return email =~REGEX_PATTERN ? true : false
    end
  
    def inputDatails
      puts "Enter patient name"
      name = gets.chomp()
      puts "Enter patient age"
      age = gets.chomp()
      puts "Enter patient disease"
      disease = gets.chomp()
      puts "Enter patient email"
      email = gets.chomp()
      while validEmail?(email).eql? false
        validate = ExceptionModule::InvalidEmail
        begin
          raise validate.new("email not valid")
        rescue => e
          puts "#{e.message} #{email}" # "print invalid email"
        end
        print "enter valid email : "
        email = gets.chomp
      end
      
      return PatientModule::Patient.new(name,age,disease,email)
    end
    def showPatientDetail
      @patient.showDetails
    end
  
    def showDetails
      if isBooked
        puts "==Booked=="
      else
        puts "**Empty**"
      end
    end
  end
  
end