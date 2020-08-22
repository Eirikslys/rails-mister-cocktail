class AddCocktailAndIngredientIdToDoses < ActiveRecord::Migration[6.0]
  def change
    change_table(:doses) do |t|
      # add_reference :doses, :cocktail_id, foreign_key: true
      t.references :cocktail, foreign_key: true
      t.references :ingredient, foreign_key: true
    end
  end
end
