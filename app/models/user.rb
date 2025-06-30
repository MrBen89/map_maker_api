class User < ApplicationRecord
    has_many :square_maps, dependent: :destroy
end
