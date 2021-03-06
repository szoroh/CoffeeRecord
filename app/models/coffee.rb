# frozen_string_literal: true

class Coffee < ApplicationRecord
  validates :name, presence: true
  validates :roasters, presence: true

  has_many :recipes, dependent: :destroy
  belongs_to :user
end
