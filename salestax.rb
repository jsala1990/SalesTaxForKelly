class SalesTax	
	BASIC_TAX = 0.10 
	EXEMPT_TAX = 0.00
	IMPORT_TAX = 0.05
	EXEMPT = ["books", "book","food","medical","chocolates","chocolate","pills"]
  	IMPORTED = ["import","imported"]
	attr_accessor :product, :total_tax

	def initialize product
		@product = product
	end

  def is_exempt?
    result = false
    @product.split(" ").each do |item|
      result = true if EXEMPT.include? item
    end 
    result
  end

  def is_imported?
    result = false
    @product.split(" ").each do |item|
      result = true if IMPORTED.include? item
    end 
    result
  end

  	def tax
  	@total_tax = 0.0
		if is_imported? == true
			@total_tax = IMPORT_TAX + @total_tax
		end
		if is_exempt? == true
			@total_tax = EXEMPT_TAX + @total_tax
		else
			@total_tax = BASIC_TAX + @total_tax
		end
	@total_tax = total_tax.to_f.round(2)
	end
end
