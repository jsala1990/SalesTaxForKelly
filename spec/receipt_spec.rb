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

  describe "#print_receipt" do
    it "should print everything, given a location" do
      fake_file = ["1 book: 12.49","1 music CD: 16.49",
        "1 chocolate bar: 0.85","Sales Taxes: 1.5",
        "Total: 29.83"]
      new_receipt = Receipt.new "input_data/test_input_1.txt"
      new_receipt.print_receipt.should == fake_file
    end

    it "should print everything, given a location" do
      fake_file = ["1 imported box of chocolates: 10.5",
        "1 imported bottle of perfume: 54.62",
        "Sales Taxes: 7.63",
        "Total: 65.12"]
      new_receipt = Receipt.new "input_data/test_input_2.txt"
      new_receipt.print_receipt.should == fake_file
    end

    it "should print everything, given a location" do
      pending
    end
  end
end

