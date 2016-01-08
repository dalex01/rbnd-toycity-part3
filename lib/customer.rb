class Customer
	attr_accessor :number_of_purchases
	attr_reader :name, :number_of_returns

	@@customers = [] # all customers

	def initialize(options={})
		@name = options[:name]		# name of customer
		@number_of_purchases = 0	# number of customer purchuses
		@number_of_returns = 0		# number of customer returns
		add_to_customers
	end

	# Return all customers
	def self.all
    	@@customers
  	end

	# Find customer by name
	def self.find_by_name(name)
  		@@customers.each {|customer| return customer if customer.name == name}
  	end

  	# Create new transaction if customer purchases the product or raise error if product is out of stock
  	def purchase(product)
  		if product.in_stock?
  			Transaction.new(self, product)
  		else
  			raise OutOfStockError, "#{product.title} is out of stock"
  		end
  	end

  	# Return transaction/product
  	def return(transaction_id, product)
  		transaction = Transaction.find(transaction_id)
  		if transaction.product == product
  			@number_of_returns += 1
  			product.return
  			transaction.returned = true
  		else
  			raise ReturnError, "Product can't be returned. Transaction id #{transaction_id} and product #{product.title} don't much each other."
  		end
  	end

  	private

	# Add customer to all customers or raise error if such customer is already in the list
  	def add_to_customers
  		@@customers.each do |customer|
    		raise DuplicateCustomerError, "#{@name} already exists." if customer.name == @name
    	end
   		@@customers << self
  	end

end