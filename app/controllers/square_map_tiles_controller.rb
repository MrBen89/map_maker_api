class SquareMapTilesController < ApplicationController
    before_action :cors_set_access_control_headers
    def cors_set_access_control_headers
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
        headers['Access-Control-Allow-Headers'] = '*'
        headers['Access-Control-Max-Age'] = "1728000"
    end
    
    def show
        @tiles = SquareMapTile.find(params[:id])     
        render json: @tiles
    end

    def create
        @tile = SquareMapTile.new(
            square_tile_id: params["square_tile_id"], 
            square_map_id: params["square_map_id"],
            x_pos: params["x_pos"],
            y_pos: params["y_pos"],
            tile_type: params["tile_type"] || 0,
            layer: params["layer"] || 0
            )
        
        if @tile.save
            render json: { message: "Tile created successfully", tile_id: @tile.id }, status: :created
        else
            render json: { errors: @tile.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
        @tile = SquareMapTile.find(params[:id])
        
        if @tile.update(
            square_tile_id: params["square_tile_id"],
        )
            render json: { message: "Tile updated successfully" }, status: :ok
        else
            render json: { errors: @tile.errors.full_messages }, status: :unprocessable_entity
        end
    end
end
