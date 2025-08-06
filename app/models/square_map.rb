class SquareMap < ApplicationRecord
  belongs_to :user
  has_many :square_map_tiles
end
