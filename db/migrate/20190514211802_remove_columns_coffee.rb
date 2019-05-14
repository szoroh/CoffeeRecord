class RemoveColumnsCoffee < ActiveRecord::Migration[5.2]
  def change
    remove_column :coffees, :package_quantity
    remove_column :coffees, :brew_method
    remove_column :coffees, :roast_date
    remove_column :coffees, :feedback
  end
end
