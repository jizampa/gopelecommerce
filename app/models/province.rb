class Province < ApplicationRecord
    validates :name,:acronyms, :PST, :GST, :HST, presence: true
    validates :PST, :GST, :HST, numericality: true
    has_many :users
end
