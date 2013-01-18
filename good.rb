class Good
  attr_accessor :total_price
  EXEMPT = ["books", "book","food","medical","chocolates","chocolate","pills"]
  IMPORTED = ["import","imported"]

  def initialize product, price
    @product = product[/([a-zA-Z]+.)+/]
    @total_price = price.to_f
  end

  def total_tax
    sales_tax = SalesTax.new(@product).tax
    return sales_tax
  end

  def price
    ((1 + total_tax) * @total_price.to_f).round(2)
  end

end
