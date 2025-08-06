class UsersController < ApplicationController
    def show
        user = User.find(params[:id])
        maps = SquareMap.where(user_id: user.id)
        render json: {user: user, maps: maps}, status: :ok
    rescue ActiveRecord::RecordNotFound
        render json: { error: "User not found" }, status: :not_found
    end
end
