class SquareMapsController < ApplicationController
  def show
    @tiles = SquareMapTile.where("square_map_id = ?", params["id"])
    render json: @tiles.to_json
  end
end
