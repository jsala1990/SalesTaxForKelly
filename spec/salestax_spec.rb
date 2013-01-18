require 'spec_helper'

describe SalesTax do
	before :each do
		@salesTax = SalesTax.new "chocolate bar"
	end
	describe "#new" do
		it "should return a new SalesTax object" do
			@salesTax.should be_an_instance_of SalesTax
		end
		it "throws an ArgumentError when given too many parameters" do
			lambda {SalesTax.new "basic", 12.00, 12.00}.should raise_exception ArgumentError
		end
	end
	describe "#total_tax" do
		it "should be correct price for imported bottle of perfume" do
			salesTax = SalesTax.new "imported bottle of perfume"
			salesTax.tax.should eql 0.15
		end
		it "should be correct for box of imported chocolates" do
			salesTax = SalesTax.new "box of imported chocolates"
			salesTax.tax.should eql 0.05
		end
		it "should be correct for chocolate bar" do
			salesTax = SalesTax.new "chocolate bar"
			salesTax.tax.should eql 0.00
		end
		it "should be correct for music CD" do
			salesTax = SalesTax.new "music CD"
			salesTax.tax.should eql 0.10
		end
	end
	describe "#exempt" do
		it "should be true for book" do
			salesTax = SalesTax.new "book"
			salesTax.is_exempt?.should be_true
		end
		it "should be true for packet of headache pills" do
			salesTax = SalesTax.new "packet of headache pills"
			salesTax.is_exempt?.should be_true
		end
		it "should be false for imported bottle of perfume" do
			salesTax = SalesTax.new "imported bottle of perfume"
			salesTax.is_exempt?.should be_false
		end
		it "should be false for music CD" do
			salesTax = SalesTax.new "music CD"
			salesTax.is_exempt?.should be_false
		end
	end
	describe "#imported" do
		it "should be true for imported bottle of perfume" do
			salesTax = SalesTax.new "imported bottle of perfume"
			salesTax.is_imported?.should be_true
		end
		it "should be true for box of imported chocolates" do
			salesTax = SalesTax.new "box of imported chocolates"
			salesTax.is_imported?.should be_true
		end
		it "should be false for chocolate bar" do
			salesTax = SalesTax.new "chocolate bar"
			salesTax.is_imported?.should be_false
		end
		it "should be false for packet of headache pills" do
			salesTax = SalesTax.new "packet of headache pills"
			salesTax.is_imported?.should be_false
		end
	end
end