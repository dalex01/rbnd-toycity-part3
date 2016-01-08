require_relative "lib/errors"
require_relative "lib/customer"
require_relative "lib/product"
require_relative "lib/transaction"

# PRODUCTS

Product.new(title: "LEGO Iron Man vs. Ultron", price: 22.99, stock: 55)
Product.new(title: "Nano Block Empire State Building", price: 49.99, stock: 12)
Product.new(title: "LEGO Firehouse Headquarter", price: 199.99, stock: 0)

Product.all.count # Should return 3

#Product.new(title: "LEGO Iron Man vs. Ultron", price: 22.99, stock: 55)
# Should return DuplicateProductError: 'LEGO Iron Man vs. Ultron' already exists.

nanoblock = Product.find_by_title("Nano Block Empire State Building")
firehouse = Product.find_by_title("LEGO Firehouse Headquarter")
ironman = Product.find_by_title("LEGO Iron Man vs. Ultron")

nanoblock.title # Should return 'Nano Block Empire State Building'
nanoblock.price # Should return 49.99
nanoblock.stock # Should return 12
nanoblock.in_stock? # Should return true
firehouse.in_stock? # Should return false

products_in_stock = Product.in_stock
# Should return an array of all products with a stock greater than zero
products_in_stock.include?(nanoblock) # Should return true
products_in_stock.include?(firehouse) # Should return false

# CUSTOMERS

Customer.new(name: "Walter Latimer")
Customer.new(name: "Julia Van Cleve")

Customer.all.count # Should return 2

#Customer.new(name: "Walter Latimer")
# Should return DuplicateCustomerError: 'Walter Latimer' already exists.

walter = Customer.find_by_name("Walter Latimer")

walter.name # Should return "Walter Latimer"

# TRANSACTIONS

transaction = Transaction.new(walter, nanoblock)

transaction.id # Should return 1
transaction.product == nanoblock # Should return true
transaction.product == firehouse # Should return false
transaction.customer == walter # Should return true

nanoblock.stock # Should return 11

# PURCHASES

walter.purchase(nanoblock)

Transaction.all.count # Should return 2

transaction2 = Transaction.find(2)
transaction2.product == nanoblock # Should return true

#walter.purchase(firehouse)
# Should return OutOfStockError: 'LEGO Firehouse Headquarter' is out of stock.

walter.return(1, nanoblock)
Transaction.find(1).returned == true # Should return true
Transaction.find(1).returned == false # Should return true

walter.purchase(ironman)
nanoblock_transactions = Transaction.find_by_product(nanoblock).count # Should return only two nanoblock transactions

walter.number_of_purchases # Should be 3
walter.number_of_returns # Should be 1