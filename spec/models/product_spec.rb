require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    it "is valid with valid attributes" do 
      @category = Category.new
      product = Product.new
      product.name = "Anything"
      product.price = 1
      product.quantity = 1
      product.category = @category
      expect(product).to be_valid
    end

    it "is not valid without a Name" do
      @category = Category.new
      product = Product.new
      product.name = nil
      product.price_cents = 1
      product.quantity = 1
      product.category = @category
      expect(product).to_not be_valid
    end

    it "is not valid without a price" do
      @category = Category.new
      product = Product.new
      product.name = "Anything"
      product.price_cents = nil
      product.quantity = 1
      product.category = @category
      expect(product).to_not be_valid
    end

    it "is valid without a quantity" do
      @category = Category.new
      product = Product.new
      product.name = "Anything"
      product.price_cents = 1
      product.quantity = nil
      product.category = @category
      expect(product).to_not be_valid
    end

    it "is valid without a category" do
      @category = Category.new
      product = Product.new
      product.name = "Anything"
      product.price_cents = 1
      product.quantity = 1
      product.category = nil
      expect(product).to_not be_valid
    end
  end
end
