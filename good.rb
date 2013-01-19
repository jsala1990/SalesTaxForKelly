class Good
    attr_accessor :total_price

    def initialize good, price
        @good = good[/([a-zA-Z]+.)+/]
        @total_price = price
    end

    def total_tax
        sales_tax = SalesTax.new(@good).tax
        return sales_tax
    end

    def total_tax_amount
        sales_tax = SalesTax.new(@good).tax
        return (sales_tax*@total_price).round(2)
    end

    def price
        ((1 + total_tax) * @total_price).round(2)
    end
end
