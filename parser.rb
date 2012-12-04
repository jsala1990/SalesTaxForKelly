class Parser

  attr_accessor :file_location
  
  def initialize file_location
    @file_location=file_location 
  end
  def file_open
       temp = []
       file = File.open(@file_location, 'r')
       file.each { |x| temp << x}
       return temp
  end
  def seperate_line line_to_seperate
  line_to_seperate.scan(/\d+\.\d+|\d+|book/).map { |n| n }
  end
end
