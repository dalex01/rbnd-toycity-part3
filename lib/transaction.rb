class Transaction
	attr_accessor :returned
	attr_reader :id, :product, :customer

	@@id = 1			# global id of transaction
	@@transactions = []	# all transactions

	def initialize(customer, product)
		@id = @@id				# local id of transaction
		@@id += 1				# increase global id
		@@transactions << self

		@product = product		# purchased product
		@product.purchase

		@customer = customer 	# purchases customer
		@customer.number_of_purchases += 1

		@returned = false		# was transaction retuned or not
	end

	# Return all transactions
	def self.all
    	@@transactions
  	end

  	# Find transaction by id
  	def self.find(transaction)
  		@@transactions[transaction-1]
  	end

  	# Find transactions by product
	def self.find_by_product(product)
		transactions_by_product = []
		@@transactions.each do |transaction|
			transactions_by_product.push(transaction) if transaction.product == product
		end
		return transactions_by_product
  	end

end