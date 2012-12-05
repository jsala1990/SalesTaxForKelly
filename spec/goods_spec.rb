
require_relative '../goods'
describe "initialize" do
  it "should initialize correctly and have everything saved" do
    new_good = Goods.new([{:quantity => 1, :name => ["books"], :price => 12.99}])
    new_good.quantity.should == 1
    new_good.name.should == ["books"]
    new_good.price.should == 12.99
  end
end

describe "tax" do
  it "should not have tax for exempt goods" do
    new_good = Goods.new([{:quantity => 1, :name => ["books"], :price => 12.99}])
    new_good.tax.should == 0
  end
  it "should have basic tax (10%) for basic good" do
    new_good = Goods.new([{:quantity => 1, :name => ["music"], :price => 12.99}])
    new_good.tax.should == 0.1
  end
  it "should include imported tax (15%) for basic good" do
    new_good = Goods.new([{:quantity => 1, :name => ["imported","box","of","chocolates"], :price => 10.50}])
    new_good.tax.should == 0.05
  end
end

describe "good types" do
  it "should return the correct product type for books" do
    new_good = Goods.new([{:quantity => 1, :name => ["books"], :price => 12.99}])
    new_good.type.should == ["exempt"]
  end

  it "should return the correct product type for chocolate" do
    new_good = Goods.new([{:quantity => 1, :name => ["chocolate"], :price => 12.99}])
    new_good.type.should == ["basic"]
  end
  it "should return the correct product type for food" do
    new_good = Goods.new([{:quantity => 1, :name => ["food"], :price => 12.99}])
    new_good.type.should == ["exempt"]
  end
  it "should return the correct product type for import" do
    new_good = Goods.new([{:quantity => 1, :name => ["import"], :price => 12.99}])
    new_good.type.should == ["import","basic"]
  end
  it "should support multiple :name types, array?" do
    new_good = Goods.new([{:quantity => 1, :name => ["import","books"], :price => 12.99}])
    new_good.type.should == ["import","exempt"]
  end
  it "should support all  types" do
    new_good = Goods.new([{:quantity => 1, :name => ["imported","box","of","chocolates"], :price => 10.50}])
    new_good.type.should == ["import","exempt"]
  end
end
describe "total price " do
  it "should be calculated" do
    new_good = Goods.new([{:quantity => 1, :name => ["imported","box","of","chocolates"], :price => 10.00}])
    new_good.get_total_price.should == 10.50
  end
end






