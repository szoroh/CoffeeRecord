class Recipe < ApplicationRecord
  belongs_to :coffee
  belongs_to :user
end
