class SquareMapsController < ApplicationController

  def cors_set_access_control_headers
  headers['Access-Control-Allow-Origin'] = '*'
  headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
  headers['Access-Control-Allow-Headers'] = '*'
  headers['Access-Control-Max-Age'] = "1728000"
end

  def show
    cors_set_access_control_headers()
    @tiles = SquareMapTile.joins("INNER JOIN square_tiles ON square_map_tiles.square_tile_id = square_tiles.id")
    .where("square_map_id = ?", params["id"]).select("square_map_tiles.*, square_tiles.*")
    
    render json: @tiles
  end

  def create
    cors_set_access_control_headers()
    @map = SquareMap.new(name: params["name"] || "", user_id: params["user_id"] || User.first.id)
    
    if @map.save
      render json: { message: "Map created successfully", map_id: @map.id }, status: :created
    else
      render json: { errors: @map.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    cors_set_access_control_headers()
    @map = SquareMap.find(params[:id])
    
    if @map.update(name: params["name"])
      render json: { message: "Map updated successfully" }, status: :ok
    else
      render json: { errors: @map.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
