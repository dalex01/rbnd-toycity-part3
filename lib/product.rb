class Product
  attr_reader :title, :price, :stock

  @@products = [] # all products

  # Product initialization
  def initialize(options={})
    @title = options[:title]	# title of product
    @price = options[:price]	# price of product
    @stock = options[:stock]	# number of products in stock
    add_to_products
  end

  # Return all products
  def self.all
    @@products
  end

  # Find product by title
  def self.find_by_title(title)
  	@@products.each {|product| return product if product.title == title}
  end

  # Is product in stock
  def in_stock?
  	return @stock > 0 ? true : false
  end

  # Return number of products in stock
  def self.in_stock
  	products_in_stock = []
  	@@products.each {|product| products_in_stock.push(product) if product.in_stock?}
  	return products_in_stock
  end

  # Reduce number of products in stock if it was purchased
  def purchase
  	@stock -= 1
  end

  # Increase number of products in stock if it was returned
  def return
  	@stock += 1
  end

  private

  # Add product to all products or raise error if such product is already in the list
  def add_to_products
  	@@products.each do |product|
    	raise DuplicateProductError, "#{@title} already exists." if product.title == @title
    end
   	@@products << self
  end

end