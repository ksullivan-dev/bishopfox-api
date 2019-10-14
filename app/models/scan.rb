class Scan < ApplicationRecord
    has_many :hosts, dependent: :destroy
end
