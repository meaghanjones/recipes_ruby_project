require("spec_helper")

describe(Category) do
  describe ('#recipes') do
    it("has one or more recipes") do
      test_category1 = Category.create({:name => "sweets"})
      test_recipe = Recipe.create({:name => "pudding"})
      test_recipe.categories.push(test_category1)
      expect(test_recipe.categories()).to(eq([test_category1]))
    end
  end
end
