require 'spec_helper'

describe Receipt do 
	before :each do
		@parser = Parser.new "input_data_fake/test_input_1.txt"
		@receipt = Receipt.new "input_data_fake/test_input_1.txt"
	end
	describe "#new" do
		it "should return a new receipt object" do
			@receipt.should be_an_instance_of Receipt
		end
	end
	describe "#add_item" do
		it "should add new good" do
			@receipt.add_item("1 book at 12.49")
			@receipt.list_of_goods.length.should eql 1
		end
		it "should add new good" do
			@receipt.add_item("1 book at 12.49")
			@receipt.add_item("1 book at 12.49")
			@receipt.list_of_goods.length.should eql 2
		end
	end
	describe "#print_line" do
		it "should replace at with :" do 
			parsed_line = @parser.parse("1 book at 12.49")
			@receipt.print(parsed_line).should eql "1 book: 12.49"
		end
		it "should print basic good" do 
			parsed_line = @parser.parse("1 music CD at 14.99")
			@receipt.print(parsed_line).should eql "1 music CD: 16.49"
		end
		it "of individual import exempt good" do 
			parsed_line = @parser.parse("1 box of imported chocolates at 11.25")
			@receipt.print(parsed_line).should eql "1 box of imported chocolates: 11.81"
		end
		it "of individual import basic good" do 
			parsed_line = @parser.parse("1 imported bottle of perfume at 27.99")
			@receipt.print(parsed_line).should eql "1 imported bottle of perfume: 32.19"
		end
		it "of individual import exempt good" do 
			parsed_line = @parser.parse("1 box of imported chocolates at 11.25")
			@receipt.print(parsed_line).should eql "1 box of imported chocolates: 11.81"
		end
		it "of individual import basic good" do 
			parsed_line = @parser.parse("1 imported bottle of perfume at 27.99")
			@receipt.print(parsed_line).should eql "1 imported bottle of perfume: 32.19"
		end
	end
	# describe "#open_file" do
 #    	it "should open correct file" do
 #    		parser = Receipt.new "input_data/test_input_1.txt"
 #    		lambda { parser.file_open }.should_not raise_exception Errno::ENOENT
 #    	end
 #    	it "should not open incorrect file" do
	#     	parser = Receipt.new "input_data/test_input_6.txt"
	#     	lambda { parser.file_open }.should raise_exception Errno::ENOENT 
	#   	end
	#   	it "should read first Line correctly" do
	# 	    fake_line1 = "1 book at 12.49"
	# 	    fake_line2 = "1 music CD at 14.99"
	# 	    fake_line3 = "1 chocolate bar at 0.85"
	# 	    parser = Receipt.new "input_data/test_input_1.txt"
	# 	    parser.file_open.should == [fake_line1,fake_line2,fake_line3]
 #    	en
 #  	end
  	describe "#print_receipt" do
  		it "should print everything, given a location" do
  			fake_file = ["1 book: 12.49","1 music CD: 16.49",
  				"1 chocolate bar: 0.85","Sales Taxes: 1.5",
  				"Total: 29.83"]
  			new_receipt = Receipt.new "input_data/test_input_1.txt"
  			new_receipt.print_receipt.should == fake_file
  		end
#    #    it "should print everything, given a location" do
    #     fake_file = ["1 imported box of chocolates: 10.50",
    #         "1 imported bottle of perfume: 54.65",
    #         "Sales Taxes: 7.65",
    #         "Total: 65.15"]
    #     new_receipt = Receipt.new "input_data/test_input_2.txt"
    #     new_receipt.print_receipt.should == fake_file
    #   end
    #   it "should print everything, given a location" do
    #     fake_file = ["1 imported bottle of perfume: 32.19",
    #         "1 bottle of perfume: 20.89",
    #         "1 packet of headache pills: 9.75",
    #         "1 imported box of chocolates: 11.85",
    #         "Sales Taxes: 6.70",
    #         "Total: 74.68"]
    #     new_receipt = Receipt.new "input_data/test_input_3.txt"
    #     new_receipt.print_receipt.should == fake_file
    #   end
    end
	
end

