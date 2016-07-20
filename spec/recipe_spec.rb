require("spec_helper")

describe(Recipe) do
  describe ("#categories") do
    it("belongs to a category") do
      test_category1 = Category.create({:name => "sweets"})
      test_recipe = Recipe.create({:name => "blueberry cobbler", :category_id => test_category1.id})
      expect(test_recipe.categories()).to(eq([test_category1]))
    end
  end
  describe ("#ingredients") do
    it("has ingredients associated with it") do
      test_ingredient1 = Ingredient.create({:name => "sugar"})
      test_recipe = Recipe.create({:name => "raspberry cobbler"})
      test_recipe.ingredients.push(test_ingredient1)
      # test_ingredient1.recipes.push(test_recipe)
      expect(test_recipe.ingredients()).to(eq([test_ingredient1]))
    end
  end
end
