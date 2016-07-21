require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  erb(:index)
end

get("/recipes") do
  @recipes = Recipe.all()
  @ingredients = Ingredient.all()
  erb(:new_recipe_form)
end

post("/recipes/new") do
  name = params.fetch("name")
  rank = params.fetch("rank")
  instructions = params.fetch("instructions")
  Recipe.create({:name => name, :rank => rank, :instructions => instructions, :id => nil})
  redirect("/recipes")
end

patch '/add_ingredients_to_recipe' do
  ingredients =[]
  ingredients_ids = params.fetch("ingredients_ids")
  recipe_id = params.fetch("using_these").to_i()
  ingredients_id.each() do |ingredients_id|
    recipe_id << Recipe.find(ingredients_id)
  end
  ingredients.each() do |ingredient|
    ingredient.update({:name => :name, :recipe_id => recipe_id})
  end
  redirect to '/recipes'
end

post("/ingredients") do
  name = params.fetch("ingredient_name")
  Ingredient.create({:name => name, :id => nil})
  redirect("/recipes")
end
