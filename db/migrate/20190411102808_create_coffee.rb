# frozen_string_literal: true

class CreateCoffee < ActiveRecord::Migration[5.2]
  def change
    create_table :coffees do |t|
      t.string  :roasters, null: false
      t.string  :name, null: false
      t.string  :country
      t.string  :region
      t.string  :variety
      t.string  :treatment_method
      t.string  :package_quantity
      t.string  :brew_method
      t.date    :roast_date
      t.text    :feedback
      t.text    :flavour_profile
      t.integer :cultivation_altitude

      t.timestamps
    end
  end
end
