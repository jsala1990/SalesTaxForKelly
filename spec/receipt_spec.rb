€require_relative '../receipt'


describe "initialize" do
  it "should create a new object and access its info" do
    receipt = Receipt.new({:quantity => 1,:name => ["book"],:price => 12.49})
    receipt.quantity.should == 1
    receipt.name.should == ["book"]
    receipt.price.should == 12.49
  end
end

describe "calculate" do
  it "should find the total cost of a food item" do
    receipt = Receipt.new({:quantity => 1,:name => ["book"],:price => 12.49})
    receipt.get_total_cost().should == 12.49
  end 
  # it "should find the total cost of a imported perfume" do
  #   receipt = Receipt.new({:quantity => 1,:name => ["imported","perfume"],:price => 47.50})
  #   receipt.get_total_cost().should == 54.65
  # end 
end

describe "tax" do
  receipt = Receipt.new({:quantity => 1,:name => ["book"],:price => 12.49})
	it "should not have tax for exempt goods" do
    receipt.calculate_tax(["exempt"])
    receipt.total_tax.should == 0
	end
	it "should have basic tax for basic good" do
    receipt.calculate_tax(["basic"])
    receipt.total_tax.should == 0.10
	end
  it "should have import/exempt tax for imported/exempt good" do      
    receipt.calculate_tax(["import","exempt"])
    receipt.total_tax.should == 0.05
  end
  it "should have import/basic tax for imported/basic good" do
    receipt.calculate_tax(["import","basic"])
    receipt.total_tax.should == 0.15000000000000002
  end
end

describe "receipt" do 
  parsed_data = {
      :quantity => "1",
      :name => ["book","at"],
      :price => "12.49"
  }
  receipt = Receipt.new(parsed_data)
  it "should print out the right information for parsed data" do
    receipt.print_out_cost.should == "1 book: 12.49"
  end
end
  
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