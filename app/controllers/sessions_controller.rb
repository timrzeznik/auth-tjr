class SessionsController < ApplicationController
    def new

    end

    def create
        
        #find the user trying to login!
        @user = User.where({ email: params["email"] })[0]
        if @user
            if  @user.password == params["password"]
                flash[:notice] = "You logged in successfully!"
                redirect_to "/companies"
            else
                flash[:notice] = "Nope"
                redirect_to "/sessions/new"
            end
        else
            redirect_to "/sessions/new"
        end

    end

end
