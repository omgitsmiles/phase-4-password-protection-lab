class SessionController < ApplicationController

    def create
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user, status: 200
        else
            render json: { error: "Invalid Username Or Password" }, status: 401
        end
    end

    def destroy
        session.delete :user_id
        head :no_content
    end
    
end
