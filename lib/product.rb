class Product
  attr_reader :title, :price, :stock

  @@products = []

  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_to_products
  end

  def self.all
    @@products
  end

  def self.find_by_title(title)
  	@@products.each {|product| return product if product.title == title}
  end

  def in_stock?
  	return @stock > 0 ? true : false
  end

  def self.in_stock
  	products_in_stock = []
  	@@products.each {|product| products_in_stock.push(product) if product.in_stock?}
  	return products_in_stock
  end

  private

  def add_to_products
  	@@products.each do |product|
    	raise DuplicateProductError, "#{@title} already exists." if product.title == @title
    end
   	@@products << self
  end

end