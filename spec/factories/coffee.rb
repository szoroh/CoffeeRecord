FactoryBot.define do
  factory :coffee do
    name { "Ethiopia Dimtu Tero" }
    roasters { "Friedhats" }
    country { "Ethiopia" }
    region { "Unknown" }
    variety { "heirloom" }
    treatment_method { "washed" }
    package_quantity { 250 }
    flavour_profile { "flower, apricot, milk chocolate"}
    roast_date { "01/04/2019" }
  end
end
