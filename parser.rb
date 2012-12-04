class Parser

  attr_accessor :file_location
  
  def initialize file_location
    @file_location=file_location 
  end
  def file_open
       file = File.open(@file_location, 'r')
       file.readline 
  end
  def to_s
    "Receipt: #{receipt.readline}"
  end
  def quepasa

  end

end
