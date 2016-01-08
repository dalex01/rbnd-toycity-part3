class Transaction
	attr_reader :id, :product, :customer

	@@id = 1
	@@transactions = []

	def initialize(customer, product)
		@id = @@id
		@@id += 1
		@@transactions << self

		@product = product
		@product.purchase

		@customer = customer
	end

	def self.all
    	@@transactions
  	end

  	def self.find(transaction)
  		@@transactions[transaction-1]
  	end

end