class UsersController < ApplicationController

    def index
        @users = User.all 
        render :index
    end 

    def show
        @user = User.find(params[:id])
        render :show
    end 

    def new
        @user = User.new 
        render :new 
    end 

    def create
        @user = User.create(user_params)

        if @user.save 
            login!(@user)
            redirect_to users_url 
        else 
            flash[:errors] = @user.errors.full_messages
            render :new
        end 
    end 

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end 

end 