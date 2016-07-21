require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  erb(:index)
end

get("/recipes") do
  @recipes = Recipe.all()
  @ingredients = Ingredient.all()
  @categories = Category.all()
  erb(:new_recipe_form)
end

get("/recipes/:id") do
  @recipe = Recipe.find(params.fetch("id").to_i())
  @ingredients = Ingredient.all()
  erb(:recipe)
end

post("/recipes/new") do
  name = params.fetch("name")
  rank = params.fetch("rank")
  instructions = params.fetch("instructions")
  Recipe.create({:name => name, :rank => rank, :instructions => instructions, :id => nil})
  redirect("/recipes")
end

delete("/recipes/:id/delete") do
  @recipe = Recipe.find(params.fetch("id").to_i())
  @recipe.destroy()
  redirect("/recipes")
end

patch '/categories/edit' do
  recipe_id = params.fetch("categories_in_this_recipe").to_i()
  recipe = Recipe.find(recipe_id)
  categories_ids = params.fetch("categories_ids")
  recipe.update({:category_ids => categories_ids})
  redirect("/recipes")
end

post '/categories' do
  name = params.fetch("category_name")
  Ingredient.create({:name => name, :id => nil})
  redirect("/recipes")
end

patch '/add_ingredients_to_recipe' do
  recipe_id = params.fetch("ingredients_in_this_recipe").to_i()
  recipe = Recipe.find(recipe_id)
  ingredients_ids = params.fetch("ingredients_ids")
  recipe.update({:ingredient_ids => ingredients_ids})
  redirect('/recipes')
end

post("/ingredients") do
  name = params.fetch("ingredient_name")
  Ingredient.create({:name => name, :id => nil})
  redirect("/recipes")
end
