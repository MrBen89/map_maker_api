class UsersController < ApplicationController
    def show
        user = User.find(params[:id])
        maps = SquareMap.where(user_id: user.id)
        render json: {user: user, maps: maps}, status: :ok
    rescue ActiveRecord::RecordNotFound
        render json: { error: "User not found" }, status: :not_found
    end

    def create
        p params
        user = User.new(params)
        if user.save
            render json: { message: "User created successfully", user: user }, status: :created
        end
    end
end
