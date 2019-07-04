# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  validates :name, presence: true

  has_many :coffees, dependent: :destroy
  has_many :recipes, dependent: :destroy
end
