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
     fake_hash1 = {
      :quantity => "1",
      :name => ["book","at"],
      :price => "12.49"
    }
      fake_hash2 = {
      :quantity => "1",
      :name => ["music","CD","at"],
      :price => "14.99"
    }
     fake_hash3 = {
      :quantity => "1",
      :name => ["chocolate","bar","at"],
      :price => "0.85"
    }
     parser = Parser.new "input_data/test_input_1.txt"
     parser.file_open.should == [fake_hash1,fake_hash2,fake_hash3]
   end

end

describe "hash" do
    it "should make everything a hashmap!" do
    parser = Parser.new "input_data/test_input_1.txt"
    fake_hash = {
    :quantity => "1",
    :name => ["book","at"],
    :price => "12.49"
  }
    parser.hash_everything(["1","book","at","12.49"]).should == fake_hash
  end
end



