require 'spec_helper'

describe Good do
  describe "#new" do
    good = Good.new "chocolate", 12.99
    it "should return a new good object" do
      good.should be_an_instance_of Good
    end
    it "throws an ArgumentError when given more than one parameter" do
      lambda {Good.new "books", 12.99, 1.0 }.should raise_exception ArgumentError
    end
  end

  describe "#total_tax" do
    it "should be correct price for imported bottle of perfume" do
      good = Good.new "imported bottle of perfume", 47.50
      good.total_tax.should eql 0.15
    end
    it "should be correct for box of imported chocolates" do
      good = Good.new "box of imported chocolates", 10.00
      good.total_tax.should eql 0.05
    end
    it "should be correct for chocolate bar" do
      good = Good.new "chocolate bar", 0.85
      good.total_tax.should eql 0.00
    end
    it "should be correct for music CD" do
      good = Good.new "music CD", 14.99
      good.total_tax.should eql 0.10
    end
  end
  describe "#price" do
    it "should be correct price for imported bottle of perfume" do
      good = Good.new "imported bottle of perfume", 47.50
      good.price.should eql 54.62
    end
    it "should be correct for box of imported chocolates" do
      good = Good.new "box of imported chocolates", 10.00
      good.price.should eql 10.50
    end
    it "should be correct for chocolate bar" do
      good = Good.new "chocolate bar", 0.85
      good.price.should eql 0.85
    end
    it "should be correct for music CD" do
      good = Good.new "music CD", 14.99
      good.price.should eql 16.49
    end
  end

end









