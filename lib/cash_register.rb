

require 'pry'
class CashRegister
    attr_accessor :total, :discount, :price, :title, :last_transaction, :items
    
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end
    def add_item(title, price, quantity = 1)
        #binding.pry
        @last_transaction = price*quantity
        @total += @last_transaction
        quantity.times do
            @items << title
        end
    end

    def apply_discount
        #binding.pry
        self.discount = self.discount.to_f/100
        self.total = self.total - (self.total*self.discount)
        if self.discount == 0
            p "There is no discount to apply."
        else
            p "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def void_last_transaction
        @total -= @last_transaction
        if @items.count == 0
            @total = 0
        end
    end
end
