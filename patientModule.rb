module PatientModule
  class Patient
    #patient have name, age, disease, email
    def initialize(name,age,disease,email)
      @name = name
      @age = age
      @disease = disease
      @email = email
    end
  
    def showDetails()
      for i in 1..40
        print "="
      end
      puts
      puts "Patient Details:-\nName : #{@name}\nAge : #{@age}\nDisease : #{@disease}\nEmail : #{@email}"
        
    end
  end
end