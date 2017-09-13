class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :show]
    before_action :require_same_user, only: [:edit,:update,:destroy]
    before_action :require_admin, only: [:destroy]
 
    
    def new
        @user = User.new
    end
    
    
    def index
        @user = User.paginate(page: params[:page], per_page: 5)
    end
    
    def create
    @user = User.new(user_params)
    session[:user_id] = @user.id
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the Arihant blog #{@user.username}"
      redirect_to user_path(@user)
    else
     render 'new'    
    end
    end
    
    def edit
    end
    
    def show
          @user_articles = @user.arihants.paginate(page: params[:page], per_page: 5)
    end
    
    
    def destroy
    @user = User.find(params[:id])   
    @user.destroy
    flash[:danger] = "User and all articles created by user has been deleted."
    redirect_to users_path
    end
    
    def update
        
        if @user.update(user_params)
             flash[:success] = "Your account was updated succesfully."
             redirect_to arihants_path
        else
           render 'edit' 
        end    
    end
    
    private
    def user_params
    params.require(:user).permit(:username,:email,:password)
    end     
    
    def set_user
    @user = User.find(params[:id])
    end 
    
     def require_same_user
     if current_user != @user && !current_user.admin?
      flash[:danger] = "You an edit only your account."
      redirect_to root_path
     end
     end 
     
     def require_admin
         if logged_in? && !current_user.admin?
        flash[:danger] = "Only Admin user can perform that action."
        end
     end
end 