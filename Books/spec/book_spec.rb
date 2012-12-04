require 'spec_helper'

describe Book do
  
  before :each do
    @book = Book.new "Title","Author", :category
  end
  
  describe "#new" do #method name that you will be testing
    it "returns a new book object" do
      @book.should be_an_instance_of Book
    end
    
    it "throws ArgumentError when given fewer than 3 parameters" do
      lambda { Book.new "Title","Author" }.should raise_exception ArgumentError
    end
  end
  
  describe "#title" do
    it "returns the correct title" do
      @book.title.should eql "Title"
    end
  end
  
  describe "#author" do
    it "returns the correct author" do
      @book.author.should eql "Author"
    end
  end
  
  describe "#category" do
    it "returns the correct category" do
      @book.category.should eql :category
    end
  end
  
end


#Book#new
#ClassName#methodname