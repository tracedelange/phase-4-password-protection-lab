class UsersController < ApplicationController

    def create
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: {errors: "User creation Invalid."}, status: :unprocessable_entity
        end


    end

    def me
        if session[:user_id]
            user = User.find_by(id: session[:user_id])
            render json: user, status: 201
        else
            render json: {error: "Not logged in."}, status: 401
        end
    end

    # def show
    #     if session[:user_id]
    #         user = User.find_by(id: :user_id)
    #         render json: user, status: 201
    #     else
    #         render json: {error: "Not logged in."}, status: 403
    #     end
    # end

    private

    def user_params
        params.permit(:username, :password, :password_confirmation)
    end

end
