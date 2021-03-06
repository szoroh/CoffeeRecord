# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Coffee resource', type: :system do
  let!(:coffee) { Coffee.create(name: 'Ethiopia Jajmejo', roasters: 'Friedhats', id: 1) }

  describe 'index' do
    it 'enables me to list coffee profiles' do
      visit '/coffees'

      expect(page).to have_text('Ethiopia Jajmejo')
      expect(page).to have_text('Friedhats')
    end
  end

  describe 'create' do
    context 'with all data filled in properly' do
      it 'creates coffee profile correctly' do
        visit '/coffees/new'

        fill_in 'Name',                 with: 'Ehtiopia Jajmejo'
        fill_in 'Roasters',             with: 'Friedhats'
        fill_in 'Country',              with: 'Ethiopia'
        fill_in 'Region',               with: 'Oromia'
        fill_in 'Cultivation altitude', with: 1800
        fill_in 'Variety',              with: 'Heirloom'
        fill_in 'Treatment method',     with: 'Washed'
        fill_in 'Flavour profile',      with: 'Citrus'

        click_button 'Submit'

        expect(page.current_path).to eq(coffees_path)
        expect(page).to have_content('Coffee successfully created')
      end
    end

    context 'with missing name' do
      it 'fails to create a record' do
        visit '/coffees/new'

        fill_in 'Name',                 with: ''
        fill_in 'Roasters',             with: 'Friedhats'
        fill_in 'Country',              with: 'Ethiopia'
        fill_in 'Region',               with: 'Oromia'
        fill_in 'Cultivation altitude', with: 1800
        fill_in 'Variety',              with: 'Heirloom'
        fill_in 'Treatment method',     with: 'Washed'
        fill_in 'Flavour profile',      with: 'Citrus'

        click_button 'Submit'

        expect(page.current_path).to eq(new_coffee_path)
        expect(page).to have_content("Name can't be blank")
      end
    end
  end

  describe 'show' do
    let (:coffee) { create(:coffee) }

    context 'enbles me to show respective coffee' do
      it 'is valid' do
        expect(coffee.name).to             have_text('Ethiopia Dimtu Tero')
        expect(coffee.roasters).to         have_text('Friedhats')
        expect(coffee.country).to          have_text('Ethiopia')
        expect(coffee.region).to           have_text('Unknown')
        expect(coffee.variety).to          have_text('heirloom')
        expect(coffee.treatment_method).to have_text('washed')
        expect(coffee.flavour_profile).to  have_text('flower, apricot, milk chocolate')
      end
    end
  end

  describe 'delete' do
    it 'enables me to delete created coffee' do
      visit '/coffees/1'

      click_button 'Delete'
      expect(page).to have_text('Coffee was successfully deleted.')
    end
  end

  describe 'edit' do
    context 'with fulfilled validations' do
      it 'updates coffee properly' do
        visit '/coffees/1/edit'

        fill_in 'Name',     with: 'Ethiopia Guji'
        fill_in 'Roasters', with: 'J & N'

        click_button 'Submit'
        expect(page).to have_text('Coffee has been successfully updated.')
      end
    end

    context 'with wrong validations' do
      it 'does not update coffee without name' do
        visit '/coffees/1/edit'

        fill_in 'Name',     with: ''
        fill_in 'Roasters', with: 'J & N'

        click_button 'Submit'
        expect(page).to have_text("Name can't be blank")
      end

      it 'does not update coffee without roasters' do
        visit '/coffees/1/edit'

        fill_in 'Name',     with: 'Ethiopia Guji'
        fill_in 'Roasters', with: ''

        click_button 'Submit'
        expect(page).to have_text("Roasters can't be blank")
      end
    end
  end
end
