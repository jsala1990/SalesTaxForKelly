require 'spec_helper'

describe Receipt do 
	before :each do
		@receipt = Receipt.new "input_data_fake/test_input_1.txt"
	end
	describe "#new" do
		it "should return a new receipt object" do
			@receipt.should be_an_instance_of Receipt
		end
	end
	# describe "#seperate_file" do 
	# 	it "should open file and seperate by line" do 
	# 		@receipt.seperate_file.should = "1 book at 12.49"
	# 	end
	# end
	describe "#print_line" do
		it "should replace at with :" do 
			@receipt.print("1 book at 12.49").should eql "1 book: 12.49"
		end
		it "should print basic good" do 
			@receipt.print("1 music CD at 14.99").should eql "1 music CD: 16.49"
		end
		it "of individual import exempt good" do 
			@receipt.print("1 box of imported chocolates at 11.25").should eql "1 box of imported chocolates: 11.81"
		end
		it "of individual import basic good" do 
			@receipt.print("1 imported bottle of perfume at 27.99").should eql "1 imported bottle of perfume: 32.19"
		end
		it "of individual import exempt good" do 
			@receipt.print("1 box of imported chocolates at 11.25").should eql "1 box of imported chocolates: 11.81"
		end
		it "of individual import basic good" do 
			@receipt.print("1 imported bottle of perfume at 27.99").should eql "1 imported bottle of perfume: 32.19"
		end
	end
	describe "#open_file" do
    	it "should open correct file" do
    		parser = Receipt.new "input_data/test_input_1.txt"
    		lambda { parser.file_open }.should_not raise_exception Errno::ENOENT
    	end
    	it "should not open incorrect file" do
	    	parser = Receipt.new "input_data/test_input_6.txt"
	    	lambda { parser.file_open }.should raise_exception Errno::ENOENT 
	  	end
	  	it "should read first Line correctly" do
		    fake_line1 = "1 book at 12.49"
		    fake_line2 = "1 music CD at 14.99"
		    fake_line3 = "1 chocolate bar at 0.85"
		    parser = Receipt.new "input_data/test_input_1.txt"
		    parser.file_open.should == [fake_line1,fake_line2,fake_line3]
    	end
  	end
  	describe "#print_file" do
  		it "should save everything into file" do
  			fake_file = "1 book at 12.49\n"+"1 music CD at 14.99\n"+"1 chocolate bar at 0.85\n"
  			parser = Receipt.new "input_data/test_input_1.txt"

  			parser.print_receipt.should == fake_file
  		end
  	end
	
end

# describe "calculate" do
#   it "should find the total cost of a food item" do
#     receipt = Receipt.new({:quantity => 1,:name => ["book"],:price => 12.49})
#     receipt.get_total_cost().should == 12.49
#   end 
#   # it "should find the total cost of a imported perfume" do
#   #   receipt = Receipt.new({:quantity => 1,:name => ["imported","perfume"],:price => 47.50})
#   #   receipt.get_total_cost().should == 54.65
#   # end 
# end



# describe "receipt" do 
#   parsed_data = {
#       :quantity => "1",
#       :name => ["book","at"],
#       :price => "12.49"
#   }
#   receipt = Receipt.new(parsed_data)
#   it "should print out the right information for parsed data" do
#     receipt.print_out_cost.should == "1 book: 12.49"
#   end
# end
  
# describe  "receipt" do
#   new_file = Time.at(0).to_s
#   receipt = Receipt.new "input_data_fake"
#   it "should save string into a file" do
#     receipt.file_location.should == "input_data_fake"
#   end
#   it "should open a new receipt and save" do
#     receipt.save_file(new_file).should == true
#   end
# end 
