$slots = []

require_relative "exceptionModule.rb"
require_relative "patientModule.rb"
require_relative "slotModule.rb"

#variable to access slot class in SlotModule module
Slot = SlotModule::Slot
@isBooked = ExceptionModule::SlotBooked
wrongInpt = ExceptionModule::InvalidInput


#initialize slots
for i in 0...10
  $slots[i] = Slot.new
end

def bookSlot(number)
  if number<1 or number>$slots.size
    puts "wrong input" 
  elsif $slots[number-1].isBooked
      begin
        raise @isBooked.new
      rescue => e
        puts "#{e.message}" # "print invalid email message"
      end
  elsif ($slots[number-1].setPatient)
    puts "\n**Slot Booked**\n"
  end
end

def removeSlot(number)
  if number<1 or number>$slots.size
    puts "wrong input" 
  elsif $slots[number-1].isBooked.eql? false
    puts "slot is already empty"
  elsif($slots[number-1].removePatient)
    puts "\n**Slot is Now Empty**\n"
  end
end

def checkSlot(number)
  if number<1 or number>$slots.size

    puts "wrong input" 
  elsif $slots[number-1].isBooked
    $slots[number-1].showPatientDetail
  else
    puts "slot is Empty"
  end
end


loop do
  puts "=======================================   **Welcome**   ======================================="
  puts "Enter :- \n1 to View slots\n2 to Book a slot\n3 to remove Booking\n# to exit"
  input = gets.chomp.to_i
  system "clear"
  case input
    when 1
      slotIndex = 1
      for slot in $slots
        puts "Slot number #{slotIndex}"
        puts slot.showDetails
        slotIndex += 1
      end
      loop do
        puts "press slot number to view details or \"#\" to exit"
        num = gets.chomp
        if num.eql? "#"
          system "clear"
          break
        end
        checkSlot num.to_i
      end
    when 2
      puts "\nAvailable Slots\n"
      slotIndex = 1
      for slot in $slots
        if slot.isBooked.eql? false
          puts "Slot number #{slotIndex}"
          puts slot.showDetails
        end
        slotIndex += 1
      end
      loop do
        puts "Enter slot number for Booking or \"#\" to exit"
        slotNumber = gets.chomp()
        if slotNumber.eql? "#"
          system "clear"
          break
        end
        bookSlot slotNumber.to_i
      end
    when 3
      puts "\nBooked Slots\n"
      slotIndex = 1
      slotCount = $slots.size
      for slot in $slots
        if slot.isBooked.eql? true
          puts "Slot number #{slotIndex}"
          puts slot.showDetails
          slotCount -=1
        end
        slotIndex += 1
      end
      puts "No slot is booked" if slotCount == $slots.size

      loop do
        puts "press slot number to view details or \"#\" to exit"
        num = gets.chomp
        if num.eql? "#"
          system "clear"
          break
        end
        removeSlot num.to_i
      end
    else
     if (input) == ("#".to_i)
      puts "\n**Thank You**\n"
      break
     else 
      begin
        raise wrongInpt.new
      rescue => e
        puts "#{e.message}" # "print invalid email message"
      end
     end
    end
end