require_relative 'good'

class Receipt
  attr_accessor :file_location, :total_price
  @total_price

  def initialize file_location
    @total_price = 0
    @file_location = file_location
  end

  def print line
    new_line = line.split
    pre_tax_price = new_line[new_line.length-1]
    price = Good.new line,pre_tax_price.to_f 
    total_price = price.price
    new_line[new_line.length-1] = total_price
    new_line.join(" ").gsub(/ at /, ": ")
  end
  def file_open
       temp = []
       file = File.open(@file_location, 'r').each_line{ |s|
          temp << s.chomp
       }
       # file.each { |x| temp << seperate_line(x)}
       return temp
  end
  def print_receipt
    everything = file_open
    file_open.each { |x|
      product = print x
      puts product
    }
  end

  # def calculate_price line
  #   sales_tax = 0
  #   good = Good.new line
  #   price = line.split.last.to_f

  #   sales_tax = calculate_tax(good, price)
  #   pre_tax_price = line.split.last.to_f.round(2)
  #   new_price =  pre_tax_price * (1.0 + sales_tax)
  # end

  # def calculate_tax good, price
  #   sales_tax = 0.0
  #   if good.is_exempt? == false
  #     sales_tax = SalesTax.new("BASIC").tax + sales_tax
  #   else
  #     sales_tax = SalesTax.new("EXEMPT").tax + sales_tax
  #   end
  #   if good.is_imported? == true
  #     sales_tax = SalesTax.new("IMPORT").tax + sales_tax
  #   end
  #   sales_tax.to_f.round(2)
  # end

  # def calculate_tax type_of_good
  #   total_tax = []
  #   type_of_good.each do |x|
  #     total_tax << 0.00 if x == "exempt"
  #     total_tax << 0.10 if x == "basic"
  #     total_tax << 0.05 if x == "import"
  #   end
  #   @total_tax = total_tax.inject{ |sum, x| sum + x }.round(2)
  # end
  
  # def get_total_cost 
  #   tax_in_percent = calculate_tax(Goods.new([{:name => @name, :price => @price}]).type) + 1.0
  #   @quantity.to_f * @price.to_f * tax_in_percent.to_f
  # end

  # def print_out_cost
  #  cost = get_total_cost.to_s
  #  ## add a loop to print out everything in @name array
  #  @quantity.to_s << " " << @name[0]<< ": " << cost.to_s
  # end
  
  # private
    # def tax 
  #   rer = []
  #   type.each do |x| 
  #       rer << 0.0 if x == "exempt" 
  #       rer << 0.05 if x == "import"
  #       rer << 0.10 if x == "basic"
  #   end
  #   rer.inject{|sum,x| sum + x }
  # end

  # def save_file output_file
  #   new_file = "fake_data/" << output_file
  #   new_file2 = File.new(new_file, "w+")
  #   new_file2.puts("heyo");
  #   File.exists?(new_file)  
  # end
end
  
