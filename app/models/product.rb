# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, :title, :price, presence: true
  validates :price, numericality: true
  belongs_to :tag
  belongs_to :category
  mount_uploader :image, ImageUploader
end
