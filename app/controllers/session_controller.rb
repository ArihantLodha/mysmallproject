class SessionController < ApplicationController
    def new
        
    end
    
    def create
        user = User.find_by(email: params[:session][:email].downcase )
        if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:success] = "You have succesfully logged in"
        redirect_to user_path(user)
        else  
         flash[:danger] = "There is something is wrong with the Login information"
         render 'new'
        end    
    end
    
    def destroy     
        session[:user_id] = nil
         flash[:success] = "You have succesfully logged out"
         redirect_to root_path
    end 
end