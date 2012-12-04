require 'spec_helper'

describe "Library Object" do
  before :all do
    lib_arr = [
      Book.new("Book_Title_1", "Author_Name_1", :development),
      Book.new("Book_Title_2", "Author_Name_2", :design),
      Book.new("Book_Title_3", "Author_Name_3", :usability),
      Book.new("Book_Title_4", "Author_Name_4", :development),
      Book.new("Book_Title_5", "Author_Name_5", :design),
      ]
      
      File.open "books.yml", "w" do |f|
        f.write YAML::dump lib_arr
      end
  end
  
  before :each do
    @lib = Library.new "books.yml"
  end

  describe "#new" do
    context "with no parameters" do
      it "has no books" do
        lib = Library.new
        lib.should have(0).books #lib.books.length.should ==0
      end
    end
    context "with yaml file name parameters" do
      it "has five books" do
        @lib.should have(5).books
      end
    end 
end
  it "returns all the books in given category" do
    @lib.get_books_in_category(:development).length.should == 2
    #@lib.should have(0).get_books_in_category :development
  end
  it "accepts new books" do
    @lib.add_book( Book.new("Designing for the Web", "Mark Boulton", :design))
    @lib.get_book("Designing for the Web").should be_an_instance_of Book
  end
end