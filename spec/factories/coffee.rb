# frozen_string_literal: true

FactoryBot.define do
  factory :coffee do
    name { 'Ethiopia Dimtu Tero' }
    roasters { 'Friedhats' }
    country { 'Ethiopia' }
    region { 'Unknown' }
    variety { 'heirloom' }
    treatment_method { 'washed' }
    flavour_profile { 'flower, apricot, milk chocolate' }
  end
end
