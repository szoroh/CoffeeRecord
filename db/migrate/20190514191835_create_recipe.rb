class CreateRecipe < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :brew_method
      t.text :feedback
      t.string :roast_date

      t.timestamps
    end
  end
end
