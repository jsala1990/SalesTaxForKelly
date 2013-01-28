class Parser
    attr_accessor :file_location, :good, :price
    
    def initialize file_location
        @file_location = file_location
    end

    def open_file
        temp = []
        file = File.open(@file_location, 'r').each_line{ |o|
            temp << parse(o.chomp)
        }
        return temp
    end

    def parse line
        new_line = line.split
        quantity = new_line[0].to_i
        pre_tax_price = new_line[new_line.length - 1].to_f
        good = line[/([a-zA-Z]+.)+/]
        {:quantity => quantity, :good => good, :price => pre_tax_price}
    end
    
    def save_file input, time
        output_file = "input_data/test_output_1.txt" + time.to_s
        aFile = File.new(output_file,"w")
        input.each { |x|
            aFile.puts x 
        }
        aFile.close
    end
end