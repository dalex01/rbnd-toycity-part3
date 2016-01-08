# Error if duplicate product is added
class DuplicateProductError < StandardError
end

# Error if duplicate customer is added
class DuplicateCustomerError
end

# Error if product can't be purchased due to out of stock
class OutOfStockError < StandardError
end

# Error if product and transaction id does not much each other during return
class ReturnError < StandardError
end