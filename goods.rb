class Goods
  attr_reader :quantity, :name, :price

  def initialize(options)
    @quantity = options[:quantity]
    @name = options[:name]
    @price = options[:price]
  end

  def type
    if @name == "books" || @name == "food" || @name == "medical"
     "exempt"
    elsif @name =="import"
     "import" 
    else
      "basic"
    end
    
  end
  def tax
    type == "basic" ? 0.1 : 0.0
  end
end
