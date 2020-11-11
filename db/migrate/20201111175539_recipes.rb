class Recipes < ActiveRecord::Migration
  def change
    create_table :recipes do |recipe|
      recipe.string :name
      recipe.string :ingredients
      recipe.string :cook_time
    end

    def down
      drop_table :recipes
    end

  end
end
