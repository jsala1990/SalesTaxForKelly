require_relative '../parser'

describe "initialize" do
  it "should open file" do 
    lambda { Parser.new "../input_data/test_input_1.txt" }.should_not raise_exception NameError    
  end
end

describe "open file" do
  it "should open correct file" do
    parser = Parser.new "input_data/test_input_1.txt"
    lambda { parser.file_open }.should_not raise_exception Errno::ENOENT
  end
  it "should not open incorrect file" do
    parser = Parser.new "input_data/test_input_6.txt"
    lambda { parser.file_open }.should raise_exception Errno::ENOENT 
  end
   it "should read first Line correctly" do
     parser = Parser.new "input_data/test_input_1.txt"
     parser.file_open.should == "1 book at 12.49\n"
   end
end
