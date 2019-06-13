require_relative 'send_sms'
class Takeaway
    attr_reader :basket, :order_total
    def initialize
        @basket = {}
        @order_total = 0
    end

    def menu
        food_items = {3 => "chicken", 4 => "beef", 5 => "fish", 2 => "lamb"}
    end

    def display_pretty(menu) 
        menu.each_with_index { |(key, value), index|
            print "#{(index + 1).to_s}. ".center(8)
            print "#{value}".center(7)
            puts "#{key}".center(48)     
        }
    end

    def add(item)
        item.each do |price, item| 
            if  @basket[price] == nil
                @basket[price] = []
            end 
            @basket[price] << item
        end
    end

    def total(order)
        @order_total =  0
        order.each do  |k, v|
            @order_total += k * v.count
        end        
    end

    def checkout(order)
    end


    def build_text_customer(order)
            
        send_sms.body("Here is your order #{order}")
    end

    def send_message
        return true
    end


    def header
        puts "---------------Takeaway Menu---------------"
        puts "  #      Item                        Price"
        puts "-------------------------------------------"
    end

    def footer
        "------------------------------------"
    end

end

a = Takeaway.new
a.header
a.display_pretty(a.menu)
a.footer