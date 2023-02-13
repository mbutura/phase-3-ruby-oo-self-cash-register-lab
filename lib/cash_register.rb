class CashRegister
    attr_accessor :total, :discount
  
    def initialize(discount = nil)
      @total = 0
      @discount = discount
      @items = []
    end
  
    def add_item(title, price, quantity = 1)
      @total += price * quantity
      quantity.times { @items << {title: title, value: (price * quantity)} }
    end
  
    def apply_discount
      if @discount.nil?
        return "There is no discount to apply."
      else
        @total *= (1 - (@discount.to_f / 100))
        return "After the discount, the total comes to $#{@total.to_i}."
      end
    end
  
    def items
        @items.map{|item| item[:title]}
    end
  
    def void_last_transaction
      return @total if @items.empty?
      item_price = @items.pop
      @total -= item_price[:value]
    end
  end