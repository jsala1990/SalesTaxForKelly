require 'spec_helper'

describe "initialize" do
    it "should open file" do 
    lambda { Parser.new "input_data/test_input_1.txt" }.should_not raise_exception NameError    
    end
end

describe "#open_file" do
    it "should open correct file" do
        parser = Parser.new "input_data/test_input_1.txt"
        lambda { parser.open_file }.should_not raise_exception Errno::ENOENT
    end
    it "should not open incorrect file" do
        parser = Parser.new "input_data/test_input_6.txt"
        lambda { parser.open_file }.should raise_exception Errno::ENOENT 
    end
    it "should open file into array of goods/price" do
        fake_hash1 = {
            :quantity => 1,
            :good => "book at ",
            :price => 12.49
        }
        fake_hash2 = {
            :quantity => 1,
            :good => "music CD at ",
            :price => 14.99
        }
        fake_hash3 = {
            :quantity => 1,
            :good => "chocolate bar at ",
            :price => 0.85
        }
        parser = Parser.new "input_data/test_input_1.txt"
        parser.open_file.should == [fake_hash1,fake_hash2,fake_hash3]
    end
end
describe "#parse" do
    it "should return a hash of good and price" do
        expected_result = {:quantity => 1,:good => "book at ", :price => 12.49}
        parser = Parser.new "input_data/test_input_1.txt"
        parser.parse("1 book at 12.49").should eql expected_result
    end
end
describe "#save_file" do
    time = Time.now
    parser = Parser.new "input_data/test_input_1.txt"
    input = ["1 book: 12.49","1 music CD: 16.50","1 chocolate bar: 0.85"] 
    parser.save_file(input, time)

    it "should save all of receipt into file" do
        output_file = "input_data/test_output_1.txt" + time.to_s
        check_new_file = Parser.new(output_file)
        lambda {check_new_file.open_file}.should_not raise_exception Errno::ENOENT
    end
    # it "should have exact contents" do 
    #     check_new_file = Parser.new(output_file).should eql "hi"
    # end

end

# describe "hash" do
#     it "should make everything a hashmap!" do
#     parser = Parser.new "input_data/test_input_1.txt"
#     fake_hash = {
#     :quantity => "1",
#     :name => ["book","at"],
#     :price => "12.49"
#   }
#     parser.hash_everything(["1","book","at","12.49"]).should == fake_hash
#   end
# end



