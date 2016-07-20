class CreateCategories < ActiveRecord::Migration
  def change
    create_table(:categories) { |t|
      t.column(:name, :string)
    }
  end
end
