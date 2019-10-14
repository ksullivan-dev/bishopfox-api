class Host < ApplicationRecord
    belongs_to :scan
    has_many :ports, dependent: :destroy
end
