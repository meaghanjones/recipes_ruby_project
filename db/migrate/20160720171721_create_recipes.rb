class CreateRecipes < ActiveRecord::Migration
  def change
    create_table(:recipes) do |t|
      t.column(:category_id, :int)
      t.column(:ingredient_id, :int)
      t.column(:rank, :int)
      t.column(:name, :string)
    end
  end
end
