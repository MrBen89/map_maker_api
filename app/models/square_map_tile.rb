class SquareMapTile < ApplicationRecord
  belongs_to :square_map
  belongs_to :square_tile
  enum :tile_type, { tile: 0, icon: 1 }
  enum :layer, { lower: 0, middle: 1, upper: 2 }
end
