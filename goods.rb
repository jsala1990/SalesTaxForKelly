class Goods
  attr_reader :name, :price

  def initialize(options)
    options.each do |x|
    @name = x[:name]
    @price = x[:price]
    end
  end

  def type
    type_of_tax = []
    books = ["books", "book"]
    food = ["chocolates","chocolate","food"]
    medical = ["pills"]
    import = ["import","imported"]

    type_of_tax << "import" if (@name & import).any?
    type_of_tax << "exempt" if (@name & books).any?
    type_of_tax << "exempt" if (@name & food).any?
    type_of_tax << "exempt" if (@name & medical).any?
    type_of_tax << "basic"  if !type_of_tax.include? "exempt"
    type_of_tax
  end

  # def tax 
  #   rer = []
  #   type.each do |x| 
  #       rer << 0.0 if x == "exempt" 
  #       rer << 0.05 if x == "import"
  #       rer << 0.10 if x == "basic"
  #   end
  #   rer.inject{|sum,x| sum + x }
  # end
  
  def get_total_price
    @price * (tax+1)
  end
  
end
