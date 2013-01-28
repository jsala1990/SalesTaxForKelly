require_relative 'good'

class Receipt
    attr_accessor :list_of_goods, :parser

    def initialize all_purchases
        @total_price = 0
        @total_tax = 0
        @list_of_goods = []
        @parser = Parser.new all_purchases
    end

    def print line
        good = Good.new line[:good],line[:price]
        @total_price = @total_price + good.price
        @total_tax = (@total_tax + good.total_tax_amount).round(2)
        new_line = [line[:quantity],line[:good],(good.price.round(2)).to_s]
        new_line.join(" ").gsub(/ at /, ":")
    end

    def print_receipt
        parser.open_file.each { |x|
            @list_of_goods << print(x)
        }
        @list_of_goods << "Sales Taxes: " + (@total_tax.round(2)).to_s
        @list_of_goods << "Total: " + @total_price.to_s
        parser.save_file(@list_of_goods,Time.now)
        @list_of_goods

    end
    def add_item good
        line = @parser.parse good
        @list_of_goods << print(line)
    end

end


  
