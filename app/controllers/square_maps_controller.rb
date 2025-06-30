class SquareMapsController < ApplicationController
  def show
    @tiles = SquareMapTile.joins("INNER JOIN square_tiles ON square_map_tiles.square_tile_id = square_tiles.id")
    .where("square_map_id = ?", params["id"]).select("square_map_tiles.*, square_tiles.*")
    
    render json: @tiles
  end
end
