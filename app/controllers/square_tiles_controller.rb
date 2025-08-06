class SquareTilesController < ApplicationController

def cors_set_access_control_headers
  headers['Access-Control-Allow-Origin'] = '*'
  headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
  headers['Access-Control-Allow-Headers'] = '*'
  headers['Access-Control-Max-Age'] = "1728000"
end

  def all
    cors_set_access_control_headers()
    @tiles = SquareTile.all
    render json: @tiles
  end

end
