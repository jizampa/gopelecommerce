class User < ApplicationRecord
  validates :fname,:lname, :street, :city, :email, presence: true
  validates :email, uniqueness: true
  belongs_to :province
end
