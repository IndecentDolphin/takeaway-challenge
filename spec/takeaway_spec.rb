require 'takeaway'

describe Takeaway do

                    # {:chicken => 2, :beef => 4, :fish => 5, :lamb => 3 }
    let (:menu) { {3 => "chicken", 4 => "beef", 5 => "fish", 2 => "lamb"} }
    let (:basket) {{3 => ["chicken"], 4 => ["beef"]}}
    let (:setup_order) {subject.add( {3 => "chicken"} ); subject.add( {4 => "beef"} )}

    # As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices

    it "Display a number of dishes with ascociated prices"  do
        expect(subject.menu).to eq(menu)
    end

    # As a customer
    # So that I can order the meal I want
    # I would like to be able to select some number of several available dishes

    it "Allow adding selected items to order list" do
        setup_order
        expect(subject.basket).to eq(basket)
    end
    # As a customer
    # So that I can verify that my order is correct
    # I would like to check that the total I have been given matches the sum of the various dishes in my order

    it "Displays the correct total amount of the order" do
        setup_order
        subject.total(subject.basket)
        expect(subject.order_total).to eq(7)
    end

    # As a customer
    # So that I am reassured that my order will be delivered on time
    # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered


    it "Sends confirmation of order message" do
        setup_order
        subject.checkout
        expect(subject.send_message).to eq(true)
    end


end