require("spec_helper")

describe(Ingredient) do
  describe ("#recipes") do
    it("has one or more recipes that require it") do
      test_recipe1 = Recipe.create({:name => "frosted flakes"})
      test_ingredient = Ingredient.create({:name => "frosting"})
      test_ingredient.recipes.push(test_recipe1)
      expect(test_ingredient.recipes()).to(eq([test_recipe1]))
    end
  end
end
