require_relative 'goods'

class Receipt
  attr_accessor :file_location, :total_tax, :quantity, :name, :price
  
  def initialize receipt_information
    @quantity = receipt_information[:quantity]
    @name = receipt_information[:name]
    @price = receipt_information[:price]
   # @file_location = file_location
  end
  


  def calculate_tax type_of_good
    total_tax = []
    type_of_good.each do |x|
      total_tax << 0.0 if x == "exempt"
      total_tax << 0.1 if x == "basic"
      total_tax << 0.05 if x == "import"
    end
    @total_tax = total_tax.inject{ |sum, x| sum + x } 
  end
  
  def get_total_cost 
    tax_in_percent = calculate_tax(Goods.new([{:name => @name, :price => @price}]).type) + 1.0
    @quantity.to_f * @price.to_f * tax_in_percent.to_f
  end

  def print_out_cost
   cost = get_total_cost.to_s
   ## add a loop to print out everything in @name array
   @quantity.to_s << " " << @name[0]<< ": " << cost.to_s
  end
  
  private
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
  