class CreateCategoriesRecipes < ActiveRecord::Migration
  def change
    create_table(:categories_recipes) do |t|
      t.column(:category_id, :int)
      t.column(:recipe_id, :int)
    end
  end
end
