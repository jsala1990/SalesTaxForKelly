class Parser

  #attr_accessor :file_location
  
  def initialize file_location
    @file_location=file_location 
  end
  def file_open
       temp = []
       file = File.open(@file_location, 'r')
       file.each { |x| temp << seperate_line(x)}
       return temp
  end
  def seperate_line line_to_seperate
    hash_everything line_to_seperate.split(" ")

  end
  def hash_everything array_to_hash
    new_hash = {
    :quantity => array_to_hash.first,
    :name => array_to_hash[1..(array_to_hash.length-2)],
    :price => array_to_hash.last
    }
    return new_hash 
    
  end
end
