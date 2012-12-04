require_relative '../goods'

describe "initialize" do
  it "should be assigned for books" do 
    new_good = Goods.new(:quantity => 1, :name => "books", :price => 12.99)
    new_good.quantity.should == 1
    new_good.name.should == "books"
    new_good.price.should == 12.99
  end
end

describe "tax" do
  it "should not have tax for exempt goods" do
    new_good = Goods.new(:quantity => 1, :name => "books", :price => 12.99)
    new_good.tax.should == 0
  end
  it "should have basic tax (10%) for basic good" do
    new_good = Goods.new(:quantity => 1, :name => "chocolate", :price => 12.99)
    new_good.tax.should == 0.1
  end
end

describe "good types" do
  it "should return the correct product type for books" do
    new_good = Goods.new(:quantity => 1, :name => "books", :price => 12.99)
    new_good.type.should == "exempt"
  end

  it "should return the correct product type for chocolate" do
    new_good = Goods.new(:quantity => 1, :name => "chocolate", :price => 12.99)
    new_good.type.should == "basic"
  end
  it "should return the correct product type for food" do
    new_good = Goods.new(:quantity => 1, :name => "food", :price => 12.99)
    new_good.type.should == "exempt"
  end
  it "should return the correct product type for import" do
    new_good = Goods.new(:quantity => 1, :name => "import", :price => 12.99)
    new_good.type.should == "import"
  end
end
