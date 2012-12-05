class Goods
  attr_reader :quantity, :name, :price

  def initialize(options)
    options.each do |x|
    @quantity = x[:quantity]
    @name = x[:name]
    @price = x[:price]
    end
  end

  def type  
    temp = 0
    type_of_tax = []
    @name.each  do |x|
       if x == "books" || x == "food" || x == "medical" || x == "chocolates"
         temp = temp + 1
       end
     # temp > 0  ? type_of_tax << "exempt" : type_of_tax << "basic"

      if x == "import" || x == "imported"
        type_of_tax << "import"
      end
    end

      temp > 0  ? type_of_tax << "exempt" : type_of_tax << "basic"
    type_of_tax
  end

  def tax 
    rer = []
    type.each do |x| 
      if x == "exempt" 
        rer << 0.0
      end
      if x == "import"
        rer << 0.05
      end
      if x == "basic"
        rer << 0.10 
      end
    end
    rer.inject{|sum,x| sum + x }
  end
  def get_total_price
    @price * (tax+1)
  end
end
