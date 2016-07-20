require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/recipes") do
  @recipes = Recipe.all()
  erb(:new_recipe_form)
end

post("/recipes") do
  name = params.fetch("recipe_name")
  rank = params.fetch("rank")
  instructions = params.fetch("instructions")
  ingredient = []
end

post("/ingredients")
  name = params.fetch("ingredient_name")
  Ingredient.create({:name => name})
  redirect("/recipes")
end
