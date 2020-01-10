require 'rspec'
require 'dessert'
require 'chef'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }

  describe "#initialize" do
    it "sets a type" do
      d = Dessert.new("icecream", 10, Chef.new("Tarik"))
      expect(d.type).to eq("icecream")
    end

    it "sets a quantity" do
      d = Dessert.new("icecream", 10, Chef.new("Tarik"))
      expect(d.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      d = Dessert.new("icecream", 10, Chef.new("Tarik"))
      expect(d.ingredients.empty?).to eq(true)
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{Dessert.new("icecream", 10.1, Chef.new("Tarik"))}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      d = Dessert.new("icecream", 10, Chef.new("Tarik"))
      d.add_ingredient(:ice)
      expect(d.ingredients).to eq([:ice])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      d = Dessert.new("icecream", 10, Chef.new("Tarik"))
      d.add_ingredient(:ice)
      d.add_ingredient(:cream)
      d.add_ingredient(:chocolate)
      d.mix!
      ingredients = [:ice, :cream, :chocolate]
      expect(d.ingredients != ingredients).to eq(true)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      d = Dessert.new("icecream", 10, Chef.new("Tarik"))
      d.eat(5)
      expect(d.quantity).to eq(5)
    end

    it "raises an error if the amount is greater than the quantity" do
      d = Dessert.new("icecream", 10, Chef.new("Tarik"))
      expect{d.eat(11)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      d = Dessert.new("icecream", 10, Chef.new("Tarik"))
      expect(d.serve).to eq("Chef Tarik the Great Baker has made 10 icecreams!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      d = Dessert.new(:icecream, 10, Chef.new("Tarik"))
      d.make_more
      expect(d.temp).to eq(400)
    end
  end
end
