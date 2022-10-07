module ExceptionModule
  class InvalidEmail < StandardError
    def initialize(msg="email not valid")
      super(msg)
    end
  end

  class SlotBooked < StandardError
    def initialize(msg="slot already booked")
      super(msg)
    end
  end

  class InvalidInput < StandardError
    def initialize(msg="wrong input")
      super(msg)
    end
  end
end