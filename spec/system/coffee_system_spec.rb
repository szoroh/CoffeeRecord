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

  describe "create" do
    context "with all data filled in properly" do
      it "creates coffee profile correctly" do
        visit "/coffees/new"

        fill_in "Name",                 with: "Ehtiopia Jajmejo"
        fill_in "Roasters",             with: "Friedhats"
        fill_in "Country",              with: "Ethiopia"
        fill_in "Region",               with: "Oromia"
        fill_in "Cultivation altitude", with: 1800
        fill_in "Variety",              with: "Heirloom"
        fill_in "Treatment method",     with: "Washed"
        fill_in "Package quantity",     with: 250
        fill_in "Brew method",          with: "Aeropress"
        fill_in "Flavour profile",      with: "Citrus"
        fill_in "Roast date",           with: 01/01/2019

         click_button "Submit"

        expect(page.current_path).to eq(coffees_path)
        expect(page).to have_content("Coffee successfully created")
      end
    end

    context "with missing name" do
      it "fails to create a record" do
        visit "/coffees/new"


        fill_in "Name",                 with: ""
        fill_in "Roasters",             with: "Friedhats"
        fill_in "Country",              with: "Ethiopia"
        fill_in "Region",               with: "Oromia"
        fill_in "Cultivation altitude", with: 1800
        fill_in "Variety",              with: "Heirloom"
        fill_in "Treatment method",     with: "Washed"
        fill_in "Package quantity",     with: 250
        fill_in "Brew method",          with: "Aeropress"
        fill_in "Flavour profile",      with: "Citrus"
        fill_in "Roast date",           with: 01/01/2019

        click_button "Submit"

        expect(page.current_path).to eq(new_coffee_path)
        expect(page).to have_content("Name can't be blank")
      end
    end
  end
end
