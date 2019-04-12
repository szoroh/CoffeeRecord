require 'rails_helper'

RSpec.describe "Coffee resource", type: :system do
  let!(:coffee) { Coffee.create(name: "Ethiopia Jajmejo", roasters: "Friedhats") }

  describe "index" do
    it "enables me to list coffee profiles" do
      visit "/coffees"

      expect(page).to have_text("Ethiopia Jajmejo")
      expect(page).to have_text("Friedhats")
    end
  end
end
