class Customer
	attr_reader :name

	@@customers = []

	def initialize(options={})
		@name = options[:name]
		add_to_customers
	end

	def self.all
    	@@customers
  	end

	def self.find_by_name(name)
  		@@customers.each {|customer| return customer if customer.name == name}
  	end

  	private

  	def add_to_customers
  		@@customers.each do |customer|
    		raise DuplicateProductError, "#{@name} already exists." if customer.name == @name
    	end
   		@@customers << self
  	end

end