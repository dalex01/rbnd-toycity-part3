class Product
  attr_reader :title

  @@products = []

  def initialize(options={})
    @title = options[:title]
    add_to_products
  end

  def self.all
    @@products
  end

  def self.find_by_title(title)
  	@@products.each do |product|
  		return product if product.title == title
  	end
  end

  private

  def add_to_products
  	@@products.each do |product|
    	raise DuplicateProductError, "#{@title} already exists." if product.title == @title
    end
   	@@products << self
  end

end